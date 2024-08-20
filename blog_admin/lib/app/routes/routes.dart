import 'package:blog_admin/app/modules/pages/home_page.dart';
import 'package:blog_admin/app/modules/pages/login_page.dart';
import 'package:blog_admin/app/modules/pages/root_page.dart';
import 'package:blog_admin/app/modules/test/test_page.dart';
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
    GetPage(name: root, page: () => const RootPage(), binding: RootBinding()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: test, page: () => const TestPage()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
  ];
}
