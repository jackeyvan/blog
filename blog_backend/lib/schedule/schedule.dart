import 'dart:async';

import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/model/user_model.dart';
import 'package:bolg_backend/utils/utils.dart';

class Schedule {
  void start() => Future.delayed(Duration(seconds: 5), _schedule);

  /// 后台任务
  void _schedule() {
    _createAdminUser();
  }

  void _createAdminUser() async {
    final username = "admin";
    final password = "123456";

    if (!HiveBox.userBox.containsKey(username)) {
      await HiveBox.userBox.put(
          username,
          UserModel(
              username: username,
              password: password,
              token: Utils.jwtSign(username, password)));
    }
  }
}
