import 'dart:io';

import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/route/route_handler.dart';
import 'package:bolg_backend/route/shelf_cors.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main(List<String> args) async {
  print('Server run start.');

  /// 数据库
  HiveBox.init();

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsMiddleware())
      .addHandler(RouteHandler().router.call);

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  server.autoCompress = true;

  print('Server run success, listening on port ${server.port}');
  print("http://${ip.address}:${server.port}/api/v1/banner");
}
