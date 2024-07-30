import 'package:get/get.dart';

import '../modules/pages/home_page.dart';
import '../modules/pages/login_page.dart';
import '../modules/pages/root_page.dart';

abstract class _Paths {
  static const root = '/';
  static const home = '/home';
  static const login = '/login';
}

/// 路由管理器
class Routes {
  static const root = _Paths.root;

  static const home = _Paths.home;
  static const login = _Paths.login;

  static final routes = [
    GetPage(name: root, page: () => const RootPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
  ];
}
