import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';
import 'package:markdown_widget/markdown_widget.dart';

class BlogEditBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => BlogEditPageController());
}

class BlogEditPageController extends BaseController {
  final BlogModel? blog = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  void saveBlog(String text) {
    blog?.content = text;

    if (blog != null) {
      BlogRepository.updateBlog(blog!).then((value) {
        OverlayUtils.showToast("保存成功");
      }).catchError((e, _) {
        OverlayUtils.showToast(e.toString());
      });
    }
  }
}

class BlogEditPage extends BasePage<BlogEditPageController> {
  final TextEditingController editingController = TextEditingController();

  BlogEditPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(36),
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.blog?.title ?? "博客编辑"),
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                  onPressed: () => controller.saveBlog(editingController.text),
                  child: const Text("保存")),
              TextButton(onPressed: () => Get.back(), child: const Text("取消")),
            ],
          ),
          body: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: editingController,
                onChanged: (text) {},
              )),
              Expanded(child: MarkdownWidget(data: editingController.text)),
            ],
          ),
        ));
  }
}
