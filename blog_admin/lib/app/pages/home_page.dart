import 'package:blog_admin/app/model/drawer_model.dart';
import 'package:blog_admin/app/pages/book/book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

class HomePage extends BasePage<RootController> {
  const HomePage({super.key});

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
    return Scaffold(
        appBar: AppBar(
            title: Text("首页"),
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: Obx(() {
          switch (controller.currentType.value) {
            case 1:
              return keepWidgetAlive(BookPage());

            default:
              return Center(child: Text("首页"));
          }
        }));
  }
}

class RootController extends BaseController {
  final currentType = 0.obs;

  List<DrawerModel> buildLeftSides() {
    return [
      DrawerModel(
          name: "博客管理后台", leading: const Icon(Icons.flutter_dash_outlined)),
      DrawerModel(name: "首页", leading: const Icon(Icons.home)),
      DrawerModel(
          name: "书签管理",
          leading: const Icon(Icons.bookmark_add_outlined),
          type: 1),
      DrawerModel(
          name: "博客管理",
          leading: const Icon(Icons.bookmark_add_outlined),
          trailing: const Icon(Icons.arrow_drop_down_outlined),
          menus: [
            DrawerModel(
                name: "博客列表",
                leading: const Icon(Icons.list),
                isSub: true,
                type: 2),
            DrawerModel(
                name: "添加博客",
                leading: const Icon(Icons.add),
                isSub: true,
                type: 3),
          ]),
    ];
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
