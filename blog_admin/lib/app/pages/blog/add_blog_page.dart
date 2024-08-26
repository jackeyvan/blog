import 'package:blog_admin/app/pages/blog/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:get_core/get_core.dart';

class AddBlogPageController extends BaseController {
  @override
  void onReady() {}
}

class AddBlogPage extends BasePage<AddBlogPageController> {
  final BlogController blogController;

  final TextEditingController titleController = TextEditingController();

  AddBlogPage(this.blogController);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => blogController.isBlogPage.value = true,
              icon: Icon(Icons.cancel_outlined))
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
