import 'package:blog_frontend/admin/model/user_model.dart';
import 'package:blog_frontend/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AdminLoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (User.isLogin()) {
      return super.redirect(route);
    } else {
      return const RouteSettings(name: Routes.login);
    }
  }
}
