import 'package:blog_client/blog_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app/routes/routes.dart';
import 'app/service/background_service.dart';
import 'core/init/themes.dart';

final client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

/// 博客网站管理后台
void main() async {
  await Get.putAsync(() => BackgroundService().dependencies());

  runApp(const BlogBackendApp());
}

class BlogBackendApp extends StatelessWidget {
  const BlogBackendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.login,
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
