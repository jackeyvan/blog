// import 'package:crypto/crypto.dart' as crypto;

class CoreUtils {
  /// 顶级函数
  /// 初始化一些常用的方法
  /// 初始化一些常用的引用对象

// String md5(String data) {
//   return crypto.md5.convert(data.codeUnits).toString();
// }

  static String md5(String data) {
    return data;
  }

  ///  字符串是否为空
  static bool isNullOrBlank(String? data) {
    if (data == null) {
      return true;
    } else {
      return data.trim().isEmpty;
    }
  }

  /// 字符串不为空
  static bool isNotNullOrBlank(String? data) {
    return !isNullOrBlank(data);
  }
}
