import 'dart:convert';

class ApiResponse {
  final String msg;
  final int code;
  final dynamic data;

  ApiResponse({required this.msg, required this.code, required this.data});

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'code': code,
      'data': data,
    };
  }
}
