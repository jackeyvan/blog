import 'dart:convert';

class ApiResponse {
  ApiResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
    this.headers,
  });

  dynamic data;

  int? statusCode;

  String? statusMessage;

  Map<String, dynamic>? headers;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}

/// 顶层返回的Result
abstract class BaseResponse {
  int? code;
  String? msg;
  dynamic data;

  bool get success;
}
