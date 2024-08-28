import 'package:dio/dio.dart';
import 'package:get_core/src/net/api_error.dart';
import 'package:get_core/src/net/api_response.dart';
import 'package:get_core/src/net/cache/cache.dart';

enum Method {
  GET,
  POST,
}

abstract class BaseApi {
  String get baseUrl;

  T? convert<T>(dynamic data);

  BaseApi() {}

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    Cache? cache,
    dynamic body,
  }) =>
      _wrapRequest<T>(
        url: url,
        method: Method.GET,
        params: params,
        header: header,
        cache: cache,
        body: body,
      );

  Future<T?> post<T>(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    Cache? cache,
    dynamic body,
  }) =>
      _wrapRequest<T>(
        url: url,
        method: Method.POST,
        params: params,
        header: header,
        body: body,
        cache: cache,
      );

  Future<T?> _wrapRequest<T>({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    Options? options,
    dynamic body,
    Cache? cache,
  }) {
    if (cache != null) {
      header = header ?? Map<String, dynamic>();
      header["cacheMode"] = cache.mode;
      header["cacheExpire"] = cache.expire?.inMilliseconds;
    }

    return request(url, method, body: body, params: params, header: header)
        .then((response) {
      if (response.statusCode == 200) {
        return convert<T>(response.data);
      } else {
        throw ApiError(
            message: response.statusMessage, code: response.statusCode);
      }
    }).onError((e, _) {
      e is ApiError ? throw e : throw ApiError(origin: e.toString());
    });
  }

  Future<ApiResponse> request(String url, Method method,
      {dynamic body,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header});
}
