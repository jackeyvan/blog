import 'package:blog_frontend/admin/model/blog_model.dart';
import 'package:blog_frontend/admin/pages/blog/add_blog_page.dart';
import 'package:blog_frontend/api/blog_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class BlogController extends BaseController<List<BlogModel>> {
  final isBlogPage = true.obs;

  @override
  void onReady() {
    BlogRepository.fetchBlogs().then((value) {
      data = value;
      showSuccessPage();
    });
  }
}

class BlogPage extends BasePage<BlogController> {
  @override
  void dependencies() => Get.lazyPut(() => BlogController());

  @override
  Widget buildPage(BuildContext context) {
    return Obx(() => controller.isBlogPage.value
        ? buildBlogPage()
        : AddBlogPage(controller));
  }

  /// 博客列表页
  buildBlogPage() {
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(12),
          child: Row(children: [
            TextButton(
                onPressed: () => controller.isBlogPage.value = false,
                child: Text("添加博客")),
          ])),
      Expanded(child: buildObx(builder: () {
        return ListView.builder(
            itemCount: controller.data?.length,
            itemBuilder: (context, index) {
              final data = (controller.data ?? [])[index];

              return ListTile(
                title: Text(data.title ?? ""),
                subtitle: Text(data.content ?? ""),
              );
            });
      })),
    ]);
  }
}
