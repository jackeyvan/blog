import 'package:blog_frontend/api/admin_api.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class BackgroundService extends CoreService {
  @override
  void init() {
    Get.lazyPut(() => AdminApi());
  }
}
