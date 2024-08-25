import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static Future<void> init() async {
    await GetStorage.init();

    Get.lazyPut(() => GetStorage());
  }

  static T? read<T>(String key) => Get.find<GetStorage>().read<T>(key);

  static Future<void> write(String key, dynamic value) =>
      Get.find<GetStorage>().write(key, value);

  static Future<void> remove(String key) => Get.find<GetStorage>().remove(key);

  static Future<void> clear({List<String>? keys}) {
    if (keys != null && keys.isNotEmpty) {
      ///  清除指定的 Key的集合
      return Future.wait(keys.map((e) => remove(e)));
    } else {
      ///  全部清除
      return Get.find<GetStorage>().erase();
    }
  }
}
