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

  final initialText =
      '[Welcome for pull request](https://github.com/asjqkkkk/markdown_widget)😄\n\n'
          .obs;

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
              Expanded(child: buildEditWidget()),
              Expanded(child: buildMarkdownWidget()),
            ],
          ),
        ));
  }

  Widget buildEditWidget() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
      child: TextFormField(
        expands: true,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        controller: editingController,
        onChanged: (text) {
          controller.initialText.value = text;
        },
        style: const TextStyle(textBaseline: TextBaseline.alphabetic),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            hintText: 'Input Here...',
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
