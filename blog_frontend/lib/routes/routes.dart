import 'package:blog_frontend/admin/blog/admin_blog_edit_page.dart';
import 'package:blog_frontend/admin/blog/admin_blog_preview_page.dart';
import 'package:blog_frontend/admin/home/home_page.dart';
import 'package:blog_frontend/admin/user/login_middleware.dart';
import 'package:blog_frontend/admin/user/login_page.dart';
import 'package:blog_frontend/app/home_page.dart';
import 'package:get/get.dart';

abstract class _Paths {
  static const home = '/';
  static const test = '/test';
  static const login = '/login';

  static const admin = '/admin';
  static const blogEdit = '/edit';
  static const blogPreview = '/preview';
}

/// 路由管理器
class Routes {
  static const test = _Paths.test;

  static const home = _Paths.home;

  static const admin = _Paths.admin;
  static const login = admin + _Paths.login;
  static const blogEdit = admin + _Paths.blogEdit;
  static const blogPreview = admin + _Paths.blogPreview;

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      // binding: HomeBinding()
    ),
    // GetPage(name: test, page: () => const TestPage()),

    GetPage(
        name: admin,
        page: () => const AdminHomePage(),
        binding: AdminHomeBinding(),
        middlewares: [AdminLoginMiddleware()]),

    GetPage(
        name: login,
        page: () => const AdminLoginPage(),
        binding: AdminLoginBinding()),

    GetPage(
        name: blogEdit,
        page: () => AdminBlogEditPage(),
        binding: AdminBlogEditBinding()),

    GetPage(
        name: blogPreview,
        page: () => AdminBlogPreviewPage(),
        binding: AdminBlogPreviewBinding()),
  ];
}
