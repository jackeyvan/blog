import 'package:blog_flutter/app/api/admin_api.dart';
import 'package:blog_flutter/core/init/init_service.dart';
import 'package:get/get.dart';

class BackgroundService extends CoreService {
  @override
  void init() {
    Get.lazyPut(() => AdminApi());
  }
}
