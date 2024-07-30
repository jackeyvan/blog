import 'package:blog_flutter/core/page/base/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return const Center(child: Text("HomePage"));
  }
}
