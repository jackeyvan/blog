import 'dart:convert';

import 'package:blog_frontend/model/blog_model.dart';
import 'package:blog_frontend/model/user_model.dart';
import 'package:get/get.dart';

import 'blog_api.dart';

class BlogApiPath {
  static const baseUrl = "http://0.0.0.0:8080";
  static const preFix = "/api/v1";

  static const login = "$preFix/user/login";
  static const blogList = "$preFix/blog/list";
  static const blogCreate = "$preFix/blog/create";
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
        .then((data) => User.saveUser(User.fromJson(data)));
  }

  static Future<List<BlogModel>> fetchBlogs() {
    return _api.post(BlogApiPath.blogList).then(
        (e) => (e as List).map((json) => BlogModel.fromJson(json)).toList());
  }

  static Future<BlogModel> createBlog(BlogModel blog) {
    return _api
        .post(BlogApiPath.blogCreate, body: blog.toJson())
        .then((data) => BlogModel.fromJson(data));
  }
}
