import 'package:logger/logger.dart';

final logger = Logger();

class LogUtils {
  /// 常规日志，不跟环境，直接打印
  static void log(dynamic msg) => logger.i(msg);

  static void i(dynamic msg) {
    if (enableLog) logger.i(msg);
  }

  static void d(dynamic msg) {
    if (enableLog) logger.d(msg);
  }

  static void e(dynamic msg) {
    if (enableLog) logger.e(msg);
  }

  static void w(dynamic msg) {
    if (enableLog) logger.w(msg);
  }

  static bool get enableLog => true;
}
