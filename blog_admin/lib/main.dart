import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

import 'app/routes/routes.dart';
import 'app/service/background_service.dart';

/// 博客网站管理后台
void main() async {
  await BackgroundService().dependencies();

  runApp(const BlogBackendApp());
}

class BlogBackendApp extends StatelessWidget {
  const BlogBackendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: Routes.root,
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        theme: AppTheme.light);
  }
}
