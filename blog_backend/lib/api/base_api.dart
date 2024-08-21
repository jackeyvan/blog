import 'dart:convert';

import 'package:bolg_backend/const/constant.dart';
import 'package:shelf/shelf.dart';

class BaseResponse {
  dynamic data;
  String message;

  int code;

  BaseResponse({this.data, required this.code, required this.message});

  Map<String, dynamic> toJson() {
    return {"data": data, "message": message, "code": code};
  }
}

class BaseApi {
  success(dynamic data) {
    return Response.ok(jsonEncode(BaseResponse(
        data: data, code: Constant.successCode, message: Constant.successMsg)));
  }

  failed({int? code, String? message}) {
    return Response.ok(jsonEncode(BaseResponse(
        code: code ?? Constant.failCode,
        message: message ?? Constant.failMsg)));
  }
}
