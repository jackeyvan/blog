import 'package:blog_admin/app/pages/home_page.dart';
import 'package:blog_admin/app/pages/root_page.dart';
import 'package:blog_admin/app/pages/user/login_middleware.dart';
import 'package:blog_admin/app/pages/user/login_page.dart';
import 'package:get/get.dart';

abstract class _Paths {
  static const root = '/';
  static const home = '/home';
  static const test = '/test';
  static const login = '/login';
}

/// 路由管理器
class Routes {
  static const root = _Paths.root;
  static const test = _Paths.test;

  static const home = _Paths.home;
  static const login = _Paths.login;

  static final routes = [
    GetPage(
        name: root,
        page: () => const RootPage(),
        binding: RootBinding(),
        middlewares: [LoginMiddleware()]),
    GetPage(name: home, page: () => const HomePage()),
    // GetPage(name: test, page: () => const TestPage()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
  ];
}
