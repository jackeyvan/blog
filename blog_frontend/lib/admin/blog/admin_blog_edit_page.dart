import 'package:blog_frontend/api/blog_repository.dart';
import 'package:blog_frontend/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AdminBlogEditBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AdminBlogEditPageController());
}

class AdminBlogEditPageController extends BaseController {
  BlogModel? blog;

  final tags = <String>[].obs;
  final blogTags = <String>[].obs;
  final categories = <String>[].obs;
  final blogCategory = "".obs;

  final content = "".obs;

  final TextEditingController contentController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  StringTagController tagController = StringTagController();
  StringTagController categoryController = StringTagController();

  @override
  void onReady() {
    final id = int.parse(Get.parameters["id"] ?? "-1");
    if (id == -1) {
      showSuccessPage();
    } else {
      BlogRepository.fetchBlog(id).then((value) {
        titleController.text = "${value.title}";

        blogTags.value = value.tags ?? [];

        final category = value.category;
        final tags = value.tags ?? [];
        if (category != null) {
          categoryController.onTagSubmitted(category);
        }

        if (tags.isNotEmpty) {
          tags.forEach((tag) {
            tagController.onTagSubmitted(tag);
          });
        }

        /// 内容
        contentController.text = "${value.content}";
        content.value = contentController.text;

        blog = value;
      }).catchError((e, _) {
        print(e.toString());
      });
    }

    BlogRepository.fetchBlogTags().then((value) {
      tags.value = value;
    });

    BlogRepository.fetchBlogCategory().then((value) {
      categories.value = value;
    });
  }

  void updateBlog(bool isPublish) {
    final result = blog ?? BlogModel();
    final title = titleController.text;
    final content = contentController.text;
    final tags = tagController.getTags;
    final category = categoryController.getTags;

    if (title.isEmpty) {
      OverlayUtils.showToast("请输入文章标题");
    }

    if (content.isEmpty) {
      OverlayUtils.showToast("请输入文章内容");
    }

    if (tags != null && tags.isNotEmpty) {
      result.tags = tags;
    } else {
      OverlayUtils.showToast("请选择标签");
    }

    if (category != null && category.isNotEmpty) {
      result.category = category[0];
    } else {
      OverlayUtils.showToast("请选择分类");
    }

    result.title = title;
    result.content = content;
    result.published = isPublish ? 1 : 0;

    blog = result;
    BlogRepository.createOrUpdateBlog(result).then((value) {
      OverlayUtils.showToast(isPublish ? "发布成功" : "保存成功");
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
      padding: const EdgeInsets.all(16),
      child: Scaffold(
        appBar: AppBar(
          title: Text("编辑博客", style: TextStyle(fontSize: 28)),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
                onPressed: () => controller.updateBlog(false),
                child: const Text("保存")),
            TextButton(
                onPressed: () => controller.updateBlog(true),
                child: const Text("发布")),
            TextButton(
                onPressed: () => Get.back(result: controller.blog),
                child: const Text("返回")),
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
              constraints: constraints,
              child: Column(
                children: [
                  buildTitleInputWidget(),
                  buildTagInputWidget(false, controller.categoryController,
                      controller.categories),
                  buildTagInputWidget(
                      true, controller.tagController, controller.tags),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: buildEditWidget()),
                        const SizedBox(width: 8),
                        Expanded(child: buildMarkdownWidget()),
                      ],
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
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
        controller: controller.contentController,
        onChanged: (text) {
          controller.content.value = text;
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
    return Obx(() => MarkdownWidget(data: controller.content.value));
  }

  Widget buildTitleInputWidget() {
    return Padding(
        padding: EdgeInsets.all(18),
        child: Row(children: [
          Text("标题：", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                isCollapsed: true,
                hintText: "请输入标题",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                border: const OutlineInputBorder()),
            controller: controller.titleController,
          )),
          Expanded(child: SizedBox(), flex: 1)
        ]));
  }

  Widget buildTagInputWidget(
      bool isTag, StringTagController controller, List<String> tags) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 500, maxWidth: 300),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return ListTile(
                        onTap: () => onSelected(option),
                        title: Text(option, style: TextStyle(fontSize: 14)));
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return tags;
      },
      onSelected: (String selectedTag) {
        controller.onTagSubmitted(selectedTag);
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFieldTags<String>(
          textEditingController: textEditingController,
          focusNode: focusNode,
          textfieldTagsController: controller,
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            final result = controller.getTags ?? [];

            if (result.contains(tag)) {
              return '已经添加过了';
            } else if (!isTag && result.length > 0) {
              return "只能选择一个分类";
            }
            return null;
          },
          inputFieldBuilder: (context, inputFieldValues) {
            return Padding(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
              child: Row(children: [
                Text("${isTag ? "标签" : "分类"}：",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                Expanded(
                    child: TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    isCollapsed: true,
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1)),
                    errorText: inputFieldValues.error,
                    prefixIconConstraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.74),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? SingleChildScrollView(
                            controller: inputFieldValues.tagScrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children:
                                    inputFieldValues.tags.map((String tag) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.teal,
                                ),
                                margin:
                                    const EdgeInsets.only(left: 6, right: 6),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(tag,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(Icons.cancel,
                                          color: Colors.white),
                                      onTap: () {
                                        inputFieldValues.onTagRemoved(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                          )
                        : null,
                  ),
                  onChanged: inputFieldValues.onTagChanged,
                  onSubmitted: inputFieldValues.onTagSubmitted,
                )),
                Expanded(child: SizedBox(), flex: 1)
              ]),
            );
          },
        );
      },
    );
  }
}
