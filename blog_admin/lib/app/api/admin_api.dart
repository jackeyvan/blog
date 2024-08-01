import 'package:blog_client/blog_client.dart';
import 'package:blog_flutter/core/net/api_error.dart';
import 'package:blog_flutter/core/net/base_api.dart';
import 'package:dio/dio.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class AdminApi extends BaseApi {
  final _client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  Client get client => _client;

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
