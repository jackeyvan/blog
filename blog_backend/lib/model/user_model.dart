import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String? password;

  @HiveField(2)
  final String? nickname;

  @HiveField(3)
  final String? avatar;

  @HiveField(4)
  final String token;

  UserModel(
      {required this.username,
      this.nickname,
      this.password,
      this.avatar,
      required this.token});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "nickname": nickname,
      "avatar": avatar,
      "token": token
    };
  }
}
