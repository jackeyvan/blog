import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

/// Get框架提供的网络请求，自定义类继承GetApi来使用
abstract class GetApi extends BaseApi {
  late GetConnect _connect;

  GetApi() {
    _connect = GetConnect();
    _connect.baseUrl = baseUrl;
  }

  @override
  Future<ApiResponse> request(String url, Method method,
      {body, Map<String, dynamic>? params, Map<String, dynamic>? header}) {
    return _connect
        .request(url, _convertMethod(method),
            body: body, headers: _convertHeader(header), query: params)
        .then((rep) => ApiResponse(
            data: rep.body,
            statusMessage: rep.statusText,
            statusCode: rep.statusCode,
            headers: rep.headers));
  }

  String _convertMethod(Method method) {
    switch (method) {
      case Method.GET:
        return "get";
      case Method.POST:
        return "post";
      default:
        throw ApiError(message: ApiError.methodError);
    }
  }

  Map<String, String>? _convertHeader(Map<String, dynamic>? header) =>
      header?.map((key, value) => MapEntry(key, value as String));
}
