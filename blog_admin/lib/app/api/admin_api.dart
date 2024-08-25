import 'package:blog_admin/app/api/admin_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_core/get_core.dart';

class AdminApi extends BaseApi {
  @override
  void init(Dio dio) {
    BaseOptions options = BaseOptions();

    options.baseUrl = AdminApiPaths.baseUrl;

    dio.options = options;
  }

  @override
  T? convert<T>(dynamic json) {
    try {
      if (json != null) {
        final result = AdminResponse.fromJson(json);
        if (result.code == 200) {
          return result.data;
        }
        throw ApiError(message: result.msg, code: result.code);
      }
      throw ApiError();
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError(message: ApiError.parseError);
    }
  }
}

class AdminResponse extends BaseResponse {
  @override
  bool get success => code == 200;

  AdminResponse.fromJson(dynamic json) {
    code = json["code"];
    msg = json["message"];
    data = json["data"];
  }
}
