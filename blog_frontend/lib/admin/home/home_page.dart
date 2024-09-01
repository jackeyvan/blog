import 'package:blog_frontend/admin/blog/admin_blog_home_page.dart';
import 'package:blog_frontend/admin/book/book_page.dart';
import 'package:blog_frontend/model/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class AdminHomePage extends BasePage<RootController> {
  const AdminHomePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Row(children: [
      buildDrawerMenu(controller.buildLeftSides()),
      Expanded(child: buildBody())
    ]);
  }

  Widget buildDrawItem(DrawerModel model) {
    final menu = model.menus;
    if (menu != null && menu.isNotEmpty) {
      return ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 12),
          title: Text(model.name),
          leading: model.leading,
          children: menu.map(buildDrawItem).toList());
    }
    return ListTile(
        title: Text(model.name),
        leading: model.leading,
        onTap: () => controller.currentType.value = model.type ?? 0,
        trailing: model.trailing);
  }

  buildDrawerMenu(List<DrawerModel> leftSides) {
    return Drawer(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 18),
          shrinkWrap: true,
          itemBuilder: (context, index) => buildDrawItem(leftSides[index]),
          itemCount: leftSides.length),
    );
  }

  buildBody() {
    return Obx(() {
      switch (controller.currentType.value) {
        case 1:
          return keepWidgetAlive(BookPage());
        case 2:
          return keepWidgetAlive(AdminBlogHomePage());

        default:
          return Center(child: Text("博客管理后台"));
      }
    });
  }
}

class RootController extends BaseController {
  final currentType = 0.obs;

  List<DrawerModel> buildLeftSides() {
    return [
      DrawerModel(
          name: "博客管理后台", leading: const Icon(Icons.flutter_dash_outlined)),
      // DrawerModel(name: "首页", leading: const Icon(Icons.home)),
      DrawerModel(
          name: "书签管理",
          leading: const Icon(Icons.bookmark_add_outlined),
          type: 1),

      DrawerModel(
        name: "博客管理",
        leading: const Icon(Icons.article_outlined),
        type: 2,
      ),

      // DrawerModel(
      //   name: "博客管理",
      //   leading: const Icon(Icons.bookmark_add_outlined),
      //   trailing: const Icon(Icons.arrow_drop_down_outlined),
      //   menus: [
      //     DrawerModel(
      //         name: "博客列表",
      //         leading: const Icon(Icons.list),
      //         isSub: true,
      //         type: 2),
      //     DrawerModel(
      //         name: "添加博客",
      //         leading: const Icon(Icons.add),
      //         isSub: true,
      //         type: 3),
      //   ],
      // ),
    ];
  }
}

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
