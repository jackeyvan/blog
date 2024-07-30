import 'package:get/get.dart';

import '../modules/home_page.dart';
import '../modules/root_page.dart';

abstract class _Paths {
  static const root = '/';
  static const home = '/home';
}

/// 路由管理器
class Routes {
  static const root = _Paths.root;

  static const home = _Paths.home;

  static final routes = [
    GetPage(name: root, page: () => const RootPage()),
    GetPage(name: home, page: () => const HomePage()),
  ];
}
