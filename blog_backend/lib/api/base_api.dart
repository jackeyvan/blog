import 'package:bolg_backend/const/constant.dart';
import 'package:shelf/shelf.dart';

class BaseResponse {
  dynamic data;
  String message;

  int code;

  BaseResponse({this.data, required this.code, required this.message});
}

class BaseApi {
  success(dynamic data) {
    return Response.ok(BaseResponse(
        data: data, code: Constant.successCode, message: Constant.successMsg));
  }

  failed({int? code, String? message}) {
    return Response.ok(BaseResponse(
        code: code ?? Constant.failCode, message: message ?? Constant.failMsg));
  }
}
