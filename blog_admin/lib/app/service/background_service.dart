import 'package:blog_admin/app/api/admin_api.dart';
import 'package:blog_admin/core/init/init_service.dart';
import 'package:get/get.dart';

class BackgroundService extends CoreService {
  @override
  void init() {
    Get.lazyPut(() => AdminApi());
  }
}
