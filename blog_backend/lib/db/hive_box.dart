import 'package:bolg_backend/model/bookmark.dart';
import 'package:bolg_backend/model/user.dart';
import 'package:hive/hive.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class HiveBox {
  static late Box<User> userBox;
  static late Box<Bookmark> bookmarkBox;
  static late Box<BookmarkType> bookmarkTypeBox;

  static Future<void> init() async {
    Hive.init("database");

    /// 注册
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(BookmarkAdapter());
    Hive.registerAdapter(BookmarkTypeAdapter());

    /// 使用
    userBox = await Hive.openBox<User>("User");
    bookmarkBox = await Hive.openBox<Bookmark>("Bookmark");
    bookmarkTypeBox = await Hive.openBox<BookmarkType>("BookmarkType");
  }
}
