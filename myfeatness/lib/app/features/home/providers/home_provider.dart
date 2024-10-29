import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:myfeatness/app/features/home/models/user_profile.dart';
import 'package:myfeatness/app/features/home/models/article.dart';
import 'package:myfeatness/app/features/home/repository/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository;
  HomeProvider({required this.repository});

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Perfil do usuário
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  // Artigos
  final String artigoUrl = 'https://api.npoint.io/cd5cc92e412c4058c90d';
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  // Carregando os dados
  Future<void> loadData() async {
    setLoading(true);
    await _getUserProfile();
    await _fetchArticles(artigoUrl);
    setLoading(false);
    notifyListeners();
  }

  // Método para obter o perfil do usuário do Hive
  Future<void> _getUserProfile() async {
    try {
      var box = await Hive.openBox<UserProfile>('userProfileBox');
      if (box.isNotEmpty) {
        _userProfile = box.get('vini');
      }
      await box.close(); // Fechar o box após o uso
    } catch (e) {
      debugPrint('Erro ao buscar o perfil do usuário: $e');
    }
  }

  // Método para obeter os artigos
  Future<void> _fetchArticles(String url) async {
    void sortArticles() {
      if (_userProfile == null) {
        return;
      } else if (_userProfile!.goal == 'Perda de peso') {
        _articles = _articles
            .where((article) => article.goal == 'weight_loss')
            .toList();
      } else {
        _articles = _articles
            .where((article) => article.goal == 'weight_gain')
            .toList();
      }
    }

    try {
      _articles = await repository.getData(url);
      sortArticles();
    } catch (e) {
      debugPrint('Erro ao buscar artigos: $e');
    }
  }
  
}
