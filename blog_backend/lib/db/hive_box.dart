import 'package:bolg_backend/model/blog.dart';
import 'package:bolg_backend/model/bookmark.dart';
import 'package:bolg_backend/model/user.dart';
import 'package:hive/hive.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class HiveBox {
  static late Box<User> userBox;
  static late Box<Bookmark> bookmarkBox;
  static late Box<BookmarkType> bookmarkTypeBox;
  static late Box<Blog> blogBox;
  static late Box<String> blogTagBox;
  static late Box<String> blogCategoryBox;

  static Future<void> init() async {
    Hive.init("database");

    /// 注册
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(BookmarkAdapter());
    Hive.registerAdapter(BookmarkTypeAdapter());
    Hive.registerAdapter(BlogAdapter());

    /// 使用
    userBox = await Hive.openBox<User>("User");
    bookmarkBox = await Hive.openBox<Bookmark>("Bookmark");
    bookmarkTypeBox = await Hive.openBox<BookmarkType>("BookmarkType");
    blogBox = await Hive.openBox<Blog>("Blog");
    blogTagBox = await Hive.openBox<String>("BlogTag");
    blogCategoryBox = await Hive.openBox("BlogCategory");
  }
}
