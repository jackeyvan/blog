import 'package:get_core/get_core.dart';

import 'blog_repository.dart';

class BlogApi extends GetApi {
  @override
  String get baseUrl => BlogApiPath.baseUrl;

  @override
  T? convert<T>(dynamic data) {
    try {
      if (data != null && data is Map) {
        final result = BlogResponse.fromJson(data);
        if (result.code == 200) {
          return result.data;
        }
        throw ApiError(message: result.msg, code: result.code);
      }
      throw ApiError(message: ApiError.serverDataNull);
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError(message: ApiError.parseError);
    }
  }
}

class BlogResponse extends BaseResponse {
  @override
  bool get success => code == 200;

  BlogResponse.fromJson(dynamic json) {
    code = json["code"];
    msg = json["message"];
    data = json["data"];
  }
}
