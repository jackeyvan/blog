import 'dart:convert';

import 'package:blog_frontend/model/blog_model.dart';
import 'package:blog_frontend/model/user_model.dart';
import 'package:get/get.dart';

import 'blog_api.dart';

class BlogApiPath {
  static const baseUrl = "http://0.0.0.0:8080";
  static const preFix = "/api/v1";

  static const login = "$preFix/user/login";
  static const blogGet = "$preFix/blog/get";
  static const blogList = "$preFix/blog/list";
  static const blogDelete = "$preFix/blog/delete";
  static const blogEdit = "$preFix/blog/edit";
  static const blogTags = "$preFix/blog/tags";
  static const blogCategory = "$preFix/blog/category";
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

  static Future<BlogModel> fetchBlog(int id) {
    return _api
        .post(BlogApiPath.blogGet, body: jsonEncode({"id": id}))
        .then((e) => BlogModel.fromJson(e));
  }

  static Future<BlogModel> createOrUpdateBlog(BlogModel blog) {
    return _api
        .post(BlogApiPath.blogEdit, body: blog.toJson())
        .then((data) => BlogModel.fromJson(data));
  }

  static Future deleteBlog(int id) {
    return _api.post(BlogApiPath.blogDelete, body: jsonEncode({"id": id}));
  }

  static Future<List<String>> fetchBlogTags() {
    return _api
        .post(BlogApiPath.blogTags)
        .then((e) => (e as List).map((value) => value as String).toList());
  }

  static Future<List<String>> fetchBlogCategory() {
    return _api
        .post(BlogApiPath.blogCategory)
        .then((e) => (e as List).map((value) => value as String).toList());
  }
}
