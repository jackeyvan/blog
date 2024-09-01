import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class AdminBlogPreviewBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AdminBlogPreviewController());
}

class AdminBlogPreviewController extends BaseController {
  @override
  void onReady() {}
}

class AdminBlogPreviewPage extends BasePage<AdminBlogPreviewController> {
  @override
  Widget buildPage(BuildContext context) {
    return Text("博客主页");
  }
}
