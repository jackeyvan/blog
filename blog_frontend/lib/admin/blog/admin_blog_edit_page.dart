import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';
import 'package:markdown_widget/markdown_widget.dart';

class AdminBlogEditBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AdminBlogEditPageController());
}

class AdminBlogEditPageController extends BaseController {
  final Rx<BlogModel> blog = BlogModel().obs;
  final initialText = "".obs;

  final TextEditingController editingController = TextEditingController();

  @override
  void onReady() {
    final id = int.parse(Get.parameters["id"] ?? "0");
    BlogRepository.fetchBlog(id).then((value) {
      final content = value.content ?? "";
      initialText.value = content;
      editingController.text = content;
      blog.value = value;
    });
  }

  void saveBlog() {
    blog.value.content = editingController.text;
    BlogRepository.updateBlog(blog.value).then((value) {
      OverlayUtils.showToast("保存成功");
    }).catchError((e, _) {
      OverlayUtils.showToast(e.toString());
    });
  }
}

class AdminBlogEditPage extends BasePage<AdminBlogEditPageController> {
  const AdminBlogEditPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text("${controller.blog.value.title}")),
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                  onPressed: () => controller.saveBlog(),
                  child: const Text("保存")),
              TextButton(onPressed: () => Get.back(), child: const Text("返回")),
            ],
          ),
          body: Row(
            children: [
              Expanded(child: buildEditWidget()),
              const SizedBox(width: 8),
              Expanded(child: buildMarkdownWidget()),
            ],
          ),
        ));
  }

  Widget buildEditWidget() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: TextFormField(
        expands: true,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        controller: controller.editingController,
        onChanged: (text) {
          controller.initialText.value = text;
        },
        style: const TextStyle(textBaseline: TextBaseline.alphabetic),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget buildMarkdownWidget() {
    return Obx(() => MarkdownWidget(data: controller.initialText.value));
  }
}

// StoreConnector<RootState, ThemeState>(
// converter: ThemeState.storeConverter,
// builder: (context, snapshot) {
// final config =
// isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;
// final codeWrapper = (child, text, language) =>
// CodeWrapperWidget(child, text, language);
// return MarkdownWidget(
// data: initialText + controller.text,
// config: config.copy(configs: [
// isDark
// ? PreConfig.darkConfig.copy(wrapper: codeWrapper)
//     : const PreConfig().copy(wrapper: codeWrapper)
// ]),
// markdownGenerator: MarkdownGenerator(
// generators: [videoGeneratorWithTag, latexGenerator],
// inlineSyntaxList: [LatexSyntax()],
// textGenerator: (node, config, visitor) =>
// CustomTextNode(node.textContent, config, visitor),
// richTextBuilder: (span) => Text.rich(span, textScaleFactor: 1),
// ),
// );
// });
