import 'package:hive/hive.dart';
import 'package:myfeatness/app/features/home/models/user_profile.dart';

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 0;

  @override
  UserProfile read(BinaryReader reader) {
    return UserProfile(
      weight: reader.readDouble(),
      height: reader.readDouble(),
      result: reader.readDouble(),
      age: reader.readInt(),
      sex: reader.readString(),
      level: reader.readString(),
      goal: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer.writeDouble(obj.weight!);
    writer.writeDouble(obj.height!);
    writer.writeDouble(obj.result!);
    writer.writeInt(obj.age!);
    writer.writeString(obj.sex!);
    writer.writeString(obj.level!);
    writer.writeString(obj.goal!);
  }
}
