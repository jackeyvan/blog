import 'dart:convert';

import 'package:blog_admin/app/model/user_model.dart';
import 'package:get/get.dart';

import 'admin_api.dart';

class AdminApiPaths {
  static const baseUrl = "http://0.0.0.0:8080";
  static const preFix = "/api/v1";

  static const login = preFix + "/user/login";
}

class AdminRepository {
  static final _api = Get.find<AdminApi>();

  static Future<User?> login(String username, String password) {
    return _api
        .post(AdminApiPaths.login,
            body: jsonEncode({
              "username": username,
              "password": password,
            }))
        .then((json) => User.saveUser(User.fromJson(json)));
  }
}
