import 'package:blog_client/blog_client.dart';
import 'package:get/get.dart';

import 'admin_api.dart';

class AdminApiPaths {}

class AdminRepository {
  static final _api = Get.find<AdminApi>();

  static Future<AdminUser?> login(String account, String password) {
    return _api.client.adminLogin.login(account, password);
  }
}
