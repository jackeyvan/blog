import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';
import 'package:markdown_widget/markdown_widget.dart';

class AdminBlogPreviewBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AdminBlogPreviewController());
}

class AdminBlogPreviewController extends BaseController {
  final Rx<BlogModel> blog = BlogModel().obs;

  BlogModel? get blogModel => blog.value;

  @override
  void onReady() {
    final id = int.parse(Get.parameters["id"] ?? "0");
    BlogRepository.fetchBlog(id).then((value) {
      blog.value = value;
    });
  }
}

class AdminBlogPreviewPage extends BasePage<AdminBlogPreviewController> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${controller.blogModel?.title}")),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(children: [
          Expanded(child: SizedBox(), flex: 1),
          Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () =>
                      MarkdownWidget(data: "${controller.blogModel?.content}"),
                ),
              ),
              flex: 1),
          Expanded(child: SizedBox(), flex: 1),
        ]);
      }),
    );
  }
}
