import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (User.isLogin()) {
    //   return super.redirect(route);
    // } else {
    //   return const RouteSettings(name: Routes.login);
    // }

    return super.redirect(route);
  }
}
