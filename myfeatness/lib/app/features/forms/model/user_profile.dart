// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfile {
  final double weight;
  final double height;
  final double result;
  final int age;
  final String sex;
  final String level;
  final String goal;

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
