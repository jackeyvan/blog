import 'package:bolg_backend/model/user_model.dart';
import 'package:hive/hive.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class HiveBox {
  static late Box<UserModel> userBox;

  static Future<void> init() async {
    Hive.init("database");

    /// 注册
    Hive.registerAdapter(UserModelAdapter());

    /// 使用
    userBox = await Hive.openBox<UserModel>("User");
  }
}
