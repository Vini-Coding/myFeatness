import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myfeatness/app/features/forms/model/user_profile.dart';

class FormsProvider extends ChangeNotifier {
  // Objeto UserProfile
  late UserProfile _userProfile;
  UserProfile get userProfile => _userProfile;

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Inicializando o box
  Future<void> initHive() async {
    var box = await Hive.openBox<UserProfile>('userProfileBox');
    // Verificar se já existe algum perfil salvo
    if (box.isNotEmpty) {
      _userProfile = box.getAt(0)!;
    }
  }

  // Método para atualizar o objeto UserProfile dinamicamente
  void updateProfile(UserProfile newUserProfile) {
    _userProfile = newUserProfile;
    notifyListeners();
  }

  // Método para calcular o resultado e salvar no Hive
  void calculateAndSaveProfile() async {
    double result = (_userProfile.weight * 10) +
        (_userProfile.height * 6.25) -
        (_userProfile.age * 5);

    _userProfile = _userProfile.copyWith(result: result);

    // Abrindo o box e salvando o perfil atualizado
    var box = await Hive.openBox<UserProfile>('userProfileBox');
    await box.putAt(0, _userProfile);

    notifyListeners();
  }

  // Limpando
  Future<void> clearData() async {
    var box = await Hive.openBox<UserProfile>('userProfileBox');
    await box.clear();
    notifyListeners();
  }
}
