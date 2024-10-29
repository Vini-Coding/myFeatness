// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserProfile {
  @HiveField(0)
  final double? weight;
  @HiveField(1)
  final double? height;
  @HiveField(2)
  final double? result;
  @HiveField(3)
  final int? age;
  @HiveField(4)
  final String? sex;
  @HiveField(5)
  final String? level;
  @HiveField(6)
  final String? goal;

  UserProfile({
    required this.weight,
    required this.height,
    required this.result,
    required this.age,
    required this.sex,
    required this.level,
    required this.goal,
  });

  @override
  String toString() {
    return 'UserProfile(weight: $weight, height: $height, result: $result, age: $age, sex: $sex, level: $level, goal: $goal)';
  }

  UserProfile copyWith({
    double? weight,
    double? height,
    double? result,
    int? age,
    String? sex,
    String? level,
    String? goal,
  }) {
    return UserProfile(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      result: result ?? this.result,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      level: level ?? this.level,
      goal: goal ?? this.goal,
    );
  }
}
