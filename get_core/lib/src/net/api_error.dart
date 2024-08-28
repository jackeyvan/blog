class ApiError implements Exception {
  String? message;
  final int? code;

  static const defaultError = "请求失败";
  static const parseError = "数据解析异常";
  static const serverDataNull = "服务端数据为空";
  static const methodError = "未知的请求方法";

  /// 获取原始错误信息
  final String? origin;

  ApiError({
    this.message,
    this.code,
    this.origin,
  });

  @override
  String toString() {
    message ??= defaultError;
    final error = code == null ? message : "$message($code)";
    return error ?? defaultError;
  }
}
