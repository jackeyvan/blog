import 'package:blog_client/blog_client.dart';
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
    throw UnimplementedError();
  }
}
