/// 常用工具方法
class CoreUtils {
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
