import 'package:blog_flutter/core/net/api_error.dart';
import 'package:blog_flutter/core/net/base_api.dart';
import 'package:dio/dio.dart';

class AdminApi extends BaseApi {
  @override
  void init(Dio dio) {}

  @override
  T? convert<T>(json) {
    try {
      if (json.code == 200) {
        return json.data;
      } else {
        throw ApiError(message: json.msg, code: json.code);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError(message: ApiError.parseError);
    }
  }
}
