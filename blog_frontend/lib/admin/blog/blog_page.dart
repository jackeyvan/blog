import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class BlogController extends BaseController<List<BlogModel>> {
  @override
  void onReady() {
    BlogRepository.fetchBlogs().then((value) {
      data = value;
      showSuccessPage();
    });
  }
}

class AdminBlogPage extends BasePage<BlogController> {
  const AdminBlogPage({super.key});

  @override
  void dependencies() => Get.lazyPut(() => BlogController());

  @override
  Widget buildPage(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(12),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                const Expanded(
                    child: Text("博客管理", style: TextStyle(fontSize: 20))),
                TextButton(
                    onPressed: () => showCreateBlogDialog(context),
                    child: const Text("添加博客")),
              ])),
          Expanded(child: buildObx(builder: () {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(height: 0.1),
              padding: const EdgeInsets.all(18),
              itemCount: controller.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: buildBlogItem(index));
              },
            );
          })),
        ]));
  }

  buildBlogItem(int index) {
    final data = (controller.data ?? [])[index];

    final isFirst = index == 0;

    final id = isFirst ? "ID" : "${data.id}";
    final title = isFirst ? "标题" : "${data.title}";
    final category = isFirst ? "分类" : "${data.category}";
    final tags = isFirst ? "标签" : "${data.tags?[0]}";
    final publishDate = isFirst ? "发布时间" : "${data.publishDate}";

    return Row(children: [
      SizedBox(
        width: 160,
        child: Center(child: Text(id)),
      ),
      Expanded(child: Text(title)),
      Expanded(child: Text(category)),
      Expanded(child: Text(tags)),
      Expanded(child: Text(publishDate)),
      Expanded(
        child: isFirst
            ? const Text("操作")
            : Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text("编辑")),
                  TextButton(onPressed: () {}, child: const Text("删除")),
                ],
              ),
      ),
    ]);
  }

  showCreateBlogDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController tagController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

    createArticle() {
      final title = titleController.text;
      final tag = tagController.text;
      final category = categoryController.text;

      BlogRepository.createBlog(BlogModel(
          title: title,
          content: "",
          category: category,
          tags: [tag])).then((response) {
        OverlayUtils.showToast("创建成功");
        controller.data?.add(response);
        controller.showSuccessPage();
        Get.back();
      });
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              title: const Text("新增文章"),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    textFiledInput(
                        title: "标题：",
                        hintTitle: "请输入标题",
                        controller: titleController),
                    const SizedBox(height: 18),
                    textFiledInput(
                        title: "分类：",
                        hintTitle: "请输入分类",
                        controller: tagController),
                    const SizedBox(height: 18),
                    textFiledInput(
                        title: "标签：",
                        hintTitle: "请输入标签",
                        controller: categoryController),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Get.back(), child: const Text("取消")),
                TextButton(
                    onPressed: () => createArticle(), child: const Text("确定")),
              ],
            ));
  }

  textFiledInput(
      {required String title,
      String? hintTitle,
      TextEditingController? controller}) {
    return Row(children: [
      Text(title),
      const SizedBox(width: 6),
      Expanded(
          child: TextField(
        decoration: InputDecoration(
            isCollapsed: true,
            hintText: hintTitle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            border: const OutlineInputBorder()),
        controller: controller,
      ))
    ]);
  }
}
