import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_core/get_core.dart';

import 'blog_list_page.dart';

class HomeController extends BaseController with GetTickerProviderStateMixin {
  final tabs = [
    CustomTab(
      text: "首页",
      icon: Icon(Icons.home_outlined),
    ),
    CustomTab(text: "分类", icon: Icon(Icons.category_outlined)),
    CustomTab(text: "标签", icon: Icon(Icons.tag)),
    CustomTab(text: "归档", icon: Icon(Icons.history_outlined)),
    CustomTab(text: "关于", icon: Icon(Icons.account_circle_outlined)),
  ];

  final pages = [
    BlogListPage(),
    BlogListPage(),
    BlogListPage(),
    BlogListPage(),
    BlogListPage(),
  ];

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}

class HomePage extends BasePage<HomeController> {
  HomePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            dividerHeight: 0,
            tabAlignment: TabAlignment.center,
            onTap: (index) {},
            tabs: controller.tabs,
            controller: controller.tabController),
      ),
      body: TabBarView(
          children: controller.pages, controller: controller.tabController),
    );
  }
}

class CustomTab extends StatelessWidget {
  final Icon icon;
  final String text;

  CustomTab({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 4, top: 8, bottom: 8), child: icon),
        Text(text)
      ],
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeController());
}
