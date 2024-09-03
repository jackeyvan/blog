import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:blog_frontend/routes/routes.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class AdminBlogHomeController extends BaseController<List<BlogModel>> {
  @override
  void onReady() {
    loadData();
  }

  void loadData() {
    BlogRepository.fetchBlogs().then((value) {
      if (value.isEmpty) {
        showEmptyPage();
        return;
      }
      data = value;
      data?.insert(0, BlogModel());

      showSuccessPage();
    }).catchError((e, _) {
      showErrorPage(e.toString());
    });
  }

  void deleteBlog(int? id, int index) {
    BlogRepository.deleteBlog(id ?? 0).then((e) {
      data?.removeAt(index);
      if (data?.length == 0) {
        showEmptyPage();
      } else {
        showSuccessPage();
      }
      OverlayUtils.showToast("删除成功");
    }).catchError((e, _) {
      OverlayUtils.showToast(e.toString());
    });
  }

  void toNamed(String route, {BlogModel? data}) {
    Get.toNamed(route, parameters: data == null ? null : {"id": "${data.id}"})
        ?.then((value) {
      showLoadingDialog();
      loadData();
    });
  }
}

class AdminBlogHomePage extends BasePage<AdminBlogHomeController> {
  const AdminBlogHomePage({super.key});

  @override
  void dependencies() => Get.lazyPut(() => AdminBlogHomeController());

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
                    onPressed: () => controller.toNamed(Routes.blogEdit),
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
                    child: buildBlogItem(context, index));
              },
            );
          })),
        ]));
  }

  Widget buildBlogItem(BuildContext context, int index) {
    final data = (controller.data ?? [])[index];

    final isFirst = index == 0;

    final id = isFirst ? "ID" : "${data.id}";
    final title = isFirst ? "标题" : "${data.title}";
    final category = isFirst ? "分类" : "${data.category}";
    final tags = data.tags ?? [];

    final dateTime = DateTime.fromMillisecondsSinceEpoch(data.publishDate ?? 0);
    final publishTime = formatDate(dateTime, [
      yyyy,
      '-',
      mm,
      '-',
      dd,
      '  ',
      HH,
      ':',
      nn,
      ':',
      ss,
    ]);

    final publishDate = isFirst ? "发布时间" : publishTime;

    return Row(children: [
      SizedBox(
        width: 160,
        child: Center(child: Text(id)),
      ),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(title))),
      Expanded(child: Text(category)),
      Expanded(
          child: isFirst
              ? Text("标签")
              : Wrap(
                  children: tags
                      .map((tag) =>
                          TextButton(onPressed: () {}, child: Text(tag)))
                      .toList())),
      Expanded(child: Text(publishDate)),
      Expanded(
        child: isFirst
            ? const Text("操作")
            : Wrap(
                children: [
                  TextButton(
                      onPressed: () =>
                          controller.toNamed(Routes.blogEdit, data: data),
                      child: const Text("编辑")),
                  TextButton(
                      onPressed: () =>
                          controller.toNamed(Routes.blogPreview, data: data),
                      child: const Text("查看")),
                  TextButton(
                      onPressed: () => controller.deleteBlog(data.id, index),
                      child: const Text("删除")),
                ],
              ),
      ),
    ]);
  }
}
