import 'package:flutter/material.dart';
import 'package:get_core/get_core.dart';

class BookController extends BaseController {}

class BookPage extends BasePage<BookController> {
  @override
  Widget buildPage(BuildContext context) {
    return Padding(padding: EdgeInsets.all(36), child: Text("书签页面"));
  }
}
