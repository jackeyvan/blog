import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

import 'routes/routes.dart';
import 'service/background_service.dart';

void main() async {
  await BackgroundService().dependencies();
  usePathUrlStrategy();
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.admin,
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
    );
  }
}
