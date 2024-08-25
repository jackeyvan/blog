import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String username;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? nickname;

  @HiveField(3)
  String? avatar;

  @HiveField(4)
  String token;

  User(
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
