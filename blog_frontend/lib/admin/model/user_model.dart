import 'package:get_core/get_core.dart';

class User {
  static const keyUser = "keyUser";

  static User? _user;

  User({
    this.username,
    this.nickname,
    this.avatar,
    this.token,
  });

  String? username;
  String? nickname;
  String? avatar;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['nickname'] = nickname;
    map['avatar'] = avatar;
    map['token'] = token;
    return map;
  }

  factory User.fromJson(dynamic json) {
    return User(
        username: json['username'],
        nickname: json['nickname'],
        avatar: json['avatar'],
        token: json['token']);
  }

  static User? saveUser(User user) {
    if (_user != user) {
      _user = user;
      Storage.write(keyUser, user);
    }
    return _user;
  }

  static User? getUser() {
    if (_user == null) {
      final json = Storage.read(keyUser);
      if (json != null) {
        _user = User.fromJson(json);
      }
    }
    return _user;
  }

  static bool isLogin() => getUser() != null;
}
