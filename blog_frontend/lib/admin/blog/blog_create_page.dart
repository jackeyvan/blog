import 'package:blog_frontend/admin/blog/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:get_core/get_core.dart';

class BlogCreatePageController extends BaseController {
  @override
  void onReady() {}
}

class BlogCreatePage extends BasePage<BlogCreatePageController> {
  final BlogController blogController;

  final TextEditingController titleController = TextEditingController();

  BlogCreatePage(this.blogController);

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
