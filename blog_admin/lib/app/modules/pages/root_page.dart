import 'package:blog_flutter/app/modules/model/left_menu_model.dart';
import 'package:blog_flutter/core/page/base/base_controller.dart';
import 'package:blog_flutter/core/page/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends BasePage<RootController> {
  const RootPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final leftSides = controller.buildLeftSides();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Theme(
        data: ThemeData.light().copyWith(
            // primaryColor: Colors.deepOrangeAccent,
            // scaffoldBackgroundColor: Colors.white
            ),
        child: Scaffold(
            body: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Theme(
                  data: ThemeData.dark(),
                  child: Container(
                    width: width * 0.12,
                    color: Colors.blueGrey,
                    height: height,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 18, left: 18),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            buildItem(leftSides[index]),
                        itemCount: leftSides.length),
                  )),
              const Expanded(child: Text("RightSideWidget"))
            ])));
  }

  Widget buildItem(LeftMenuModel model) {
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
        trailing: model.trailing);
  }
}

class RootController extends BaseController {
  List<LeftMenuModel> buildLeftSides() {
    return [
      LeftMenuModel(
          name: "博客管理后台", leading: const Icon(Icons.flutter_dash_outlined)),
      LeftMenuModel(name: "首页", leading: const Icon(Icons.home)),
      LeftMenuModel(
          name: "菜单管理",
          leading: const Icon(Icons.menu),
          trailing: const Icon(Icons.arrow_drop_down_outlined),
          menus: [
            LeftMenuModel(
                name: "博客",
                leading: const Icon(Icons.bookmark_add),
                isSub: true),
            LeftMenuModel(
                name: "图片", leading: const Icon(Icons.image), isSub: true),
            LeftMenuModel(
                name: "时间线", leading: const Icon(Icons.timelapse), isSub: true),
          ]),
      LeftMenuModel(
          name: "博客管理",
          leading: const Icon(Icons.bookmark_add_outlined),
          trailing: const Icon(Icons.arrow_drop_down_outlined),
          menus: [
            LeftMenuModel(
                name: "博客列表", leading: const Icon(Icons.list), isSub: true),
            LeftMenuModel(
                name: "添加博客", leading: const Icon(Icons.add), isSub: true),
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
