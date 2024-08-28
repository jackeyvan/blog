import 'dart:convert';

import 'package:blog_frontend/admin/model/blog_model.dart';
import 'package:blog_frontend/admin/model/user_model.dart';
import 'package:get/get.dart';

import 'blog_api.dart';

class BlogApiPath {
  static const baseUrl = "http://0.0.0.0:8080";
  static const preFix = "/api/v1";

  static const login = "$preFix/user/login";
  static const blogList = "$preFix/blog/list";
  static const blogAdd = "$preFix/blog/add";
}

class BlogRepository {
  static final _api = Get.find<BlogApi>();

  static Future<User?> login(String username, String password) {
    return _api
        .post(BlogApiPath.login,
            body: jsonEncode({
              "username": username,
              "password": password,
            }))
        .then((json) => User.saveUser(User.fromJson(json)));
  }

  static Future<List<BlogModel>> fetchBlogs() {
    return _api.post(BlogApiPath.blogList).then(
        (e) => (e as List).map((json) => BlogModel.fromJson(json)).toList());
  }
}
