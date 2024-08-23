import 'package:blog_admin/app/model/drawer_model.dart';
import 'package:blog_admin/app/pages/book_page.dart';
import 'package:blog_admin/core/page/base/base_controller.dart';
import 'package:blog_admin/core/page/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends BasePage<RootController> {
  const RootPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final leftSides = controller.buildLeftSides();
    return Row(
      children: [buildMenuDrawer(leftSides), buildBody()],
    );
  }

  Widget buildItem(DrawerModel model) {
    /// 没有子菜单
    final menu = model.menus;
    if (menu != null && menu.isNotEmpty) {
      return ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 12),
          title: Text(model.name),
          leading: model.leading,
          children: menu.map(buildItem).toList());
    }
    return ListTile(
        title: Text(model.name),
        leading: model.leading,
        onTap: () => controller.currentType.value = model.type ?? 0,
        trailing: model.trailing);
  }

  buildMenuDrawer(List<DrawerModel> leftSides) {
    return Drawer(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 18),
          shrinkWrap: true,
          itemBuilder: (context, index) => buildItem(leftSides[index]),
          itemCount: leftSides.length),
    );
  }

  buildBody() {
    return Obx(() {
      switch (controller.currentType.value) {
        case 1:
          return keepWidgetAlive(BookPage());

        default:
          return Center(child: Text("首页"));
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

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
