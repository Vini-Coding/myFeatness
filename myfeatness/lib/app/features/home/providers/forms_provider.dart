import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myfeatness/app/features/home/models/user_profile.dart';

class FormsProvider extends ChangeNotifier {
  // Objeto UserProfile
  UserProfile _userProfile = UserProfile(
    weight: null,
    height: null,
    result: null,
    age: null,
    sex: null,
    level: null,
    goal: null,
  );
  UserProfile get userProfile => _userProfile;


  void updateWeight(double weight) {
    _userProfile = _userProfile.copyWith(weight: weight);
    notifyListeners();
  }

  void updateHeight(double height) {
    _userProfile = _userProfile.copyWith(height: height);
    notifyListeners();
  }

  void updateAge(int age) {
    _userProfile = _userProfile.copyWith(age: age);
    notifyListeners();
  }

  void updateSex(String sex) {
    _userProfile = _userProfile.copyWith(sex: sex);
    notifyListeners();
  }

  void updateLevel(String level) {
    _userProfile = _userProfile.copyWith(level: level);
    notifyListeners();
  }

  void updateGoal(String goal) {
    _userProfile = _userProfile.copyWith(goal: goal);
    notifyListeners();
  }

  // Método para calcular o resultado e salvar no Hive
  Future<void> calculateAndSaveProfile() async {
    if (_userProfile.height == null ||
        _userProfile.weight == null ||
        _userProfile.age == null ||
        _userProfile.sex == null ||
        _userProfile.level == null ||
        _userProfile.goal == null) {
      return;
    }
    double weight = _userProfile.weight!;
    double height = _userProfile.height! * 100;
    int age = _userProfile.age!;
    double result = 0;

    if (_userProfile.sex == 'Masculino') {
      result = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (_userProfile.sex == 'Feminino') {
      result = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    // Ajustando o resultado à frequência de atividade física
    switch (_userProfile.level) {
      case "Sedentário":
        result *= 1.2;
        break;
      case "Levemente ativo":
        result *= 1.375;
        break;
      case "Moderadamento ativo":
        result *= 1.55;
        break;
      case "Muito ativo":
        result *= 1.725;
        break;
      default:
        result *= 1.2;
        break;
    }

    // Ajustando o resultado ao objetivo
    if (_userProfile.goal == 'Perda de peso') {
      result *= 0.80; // equivale a uma redução de 20%
    } else if (_userProfile.goal == 'Ganho de peso') {
      result *= 1.15; // equivale a um aumento de 15%
    }

    _userProfile = _userProfile.copyWith(result: result);

    // Salvando o perfil atualizado no Hive
    var box = await Hive.openBox<UserProfile>('userProfileBox');
    await box.put('vini', _userProfile);
    await box.close(); // Fechar o box após o uso
    notifyListeners();
  }
}
