import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class BlogEditBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => BlogEditPageController());
}

class BlogEditPageController extends BaseController {
  @override
  void onReady() {}
}

class BlogEditPage extends BasePage<BlogEditPageController> {
  final TextEditingController titleController = TextEditingController();

  BlogEditPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [Text("类型")],
            ),
          ],
        ),
      ),
    );
  }
}
