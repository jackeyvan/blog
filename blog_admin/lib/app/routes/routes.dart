import 'package:blog_admin/app/pages/home_page.dart';
import 'package:blog_admin/app/pages/user/login_middleware.dart';
import 'package:blog_admin/app/pages/user/login_page.dart';
import 'package:get/get.dart';

abstract class _Paths {
  static const home = '/';
  static const test = '/test';
  static const login = '/login';
}

/// 路由管理器
class Routes {
  static const test = _Paths.test;

  static const home = _Paths.home;
  static const login = _Paths.login;

  static final routes = [
    GetPage(
        name: home,
        page: () => const HomePage(),
        binding: HomeBinding(),
        middlewares: [LoginMiddleware()]),
    // GetPage(name: test, page: () => const TestPage()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
  ];
}
