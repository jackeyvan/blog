import 'package:flutter/material.dart';
import 'package:get_core/get_core.dart';

class BookController extends GetRefreshListController {
  @override
  Future<List> loadListData(int page, bool isRefresh) {
    // TODO: implement loadListData
    throw UnimplementedError();
  }
}

class BookPage extends GetRefreshPage<BookController> {
  @override
  Widget buildPage(BuildContext context) {
    return Padding(padding: EdgeInsets.all(36), child: Text("书签页面"));
  }
}
