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
  static const blogDelete = "$preFix/blog/delete";
  static const blogUpdate = "$preFix/blog/update";
  static const blogEdit = "$preFix/blog/edit";
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

  static Future deleteBlog(int id) {
    return _api.post(BlogApiPath.blogDelete, body: jsonEncode({"id": id}));
  }

  static Future<BlogModel> updateOrEditBlog(bool isUpdate, BlogModel blog) {
    return _api
        .post(isUpdate ? BlogApiPath.blogUpdate : BlogApiPath.blogEdit,
            body: blog.toJson())
        .then((data) => BlogModel.fromJson(data));
  }
}
