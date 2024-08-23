import 'package:flutter/cupertino.dart';

class DrawerModel {
  final String name;
  final Icon leading;
  final Icon? trailing;
  final int? type;
  bool isSub;
  final List<DrawerModel>? menus;

  DrawerModel(
      {required this.name,
      required this.leading,
      this.type,
      this.trailing,
      this.menus,
      this.isSub = false});
}
