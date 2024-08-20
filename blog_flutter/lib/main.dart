import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/routes.dart';
import 'app/service/background_service.dart';
import 'core/init/themes.dart';

void main() async {
  await Get.putAsync(() => BackgroundService().dependencies());

  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.root,
      // initialBinding: BlogBindings(),
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
