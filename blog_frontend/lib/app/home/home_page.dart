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
      appBar: CustomAppBar(
        tabBar: TabBar(
            dividerHeight: 0,
            tabAlignment: TabAlignment.center,
            onTap: (index) {},
            tabs: controller.tabs,
            controller: controller.tabController),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: controller.pages,
          controller: controller.tabController),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar tabBar;

  final height = 100.0;
  final titlePadding = 72.0;

  const CustomAppBar({super.key, required this.tabBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey.shade200,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Text("万合天宜",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          SizedBox(width: titlePadding),
          tabBar
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
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
