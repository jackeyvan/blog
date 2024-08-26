import 'package:blog_admin/app/api/admin_repository.dart';
import 'package:blog_admin/app/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class BlogController extends BaseController<List<BlogModel>> {
  @override
  void onReady() {
    AdminRepository.fetchBlogs().then((value) {
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
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(12),
          child: Row(children: [
            TextButton(onPressed: () {}, child: Text("添加博客")),
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
