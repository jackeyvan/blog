import 'dart:async';

import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/model/bookmark.dart';
import 'package:bolg_backend/model/user.dart';
import 'package:bolg_backend/utils/utils.dart';

class Schedule {
  void start() => Future.delayed(Duration(seconds: 5), _schedule);

  /// 后台任务
  void _schedule() {
    print("Schedule run start.");
    _createAdminUser();
    _crateBookmarkTabs();
  }

  void _createAdminUser() async {
    final username = "admin";
    final password = "123456";

    await HiveBox.userBox.put(
        username,
        User(
            username: username,
            password: password,
            token: Utils.jwtSign(username, password)));
  }

  void _crateBookmarkTabs() async {
    final tabs = <BookmarkType>[
      BookmarkType(name: "谷歌", id: 1),
      BookmarkType(name: "科技", id: 2),
      BookmarkType(name: "Flutter", id: 3),
    ];

    await HiveBox.bookmarkTypeBox.clear();
    await HiveBox.bookmarkTypeBox.addAll(tabs);
  }
}
