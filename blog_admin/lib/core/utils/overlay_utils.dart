import 'package:blog_flutter/core/utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// 封装顶级弹窗工具类
class OverlayUtils {
  /// 普通的提示对话框
  static AlertDialog buildDialog(
    String content, {
    String? title,
    String? cancel,
    String? confirm,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return AlertDialog(
      title: Text(title ?? '温馨提示'),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(cancel ?? '取消'),
          onPressed: () {
            onCancel != null
                ? onCancel.call()
                : Get.back(); // Dismiss alert dialog
          },
        ),
        TextButton(
          child: Text(confirm ?? '确认'),
          onPressed: () {
            onConfirm != null
                ? onConfirm.call()
                : Get.back(); // Dismiss alert dialog
          },
        ),
      ],
    );
  }

  /// 展示加载弹窗
  static Future<T> showOverlay<T>(Future<T> Function() onLoad) {
    return Get.showOverlay(
        loadingWidget: const Material(
            color: Colors.transparent,
            child: Center(
                child: Card(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 36),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text("加载中")
                    ],
                  )),
            ))),
        asyncFunction: onLoad);
  }

  /// SnackBar
  static showSnackBar(String? msg) {
    if (CoreUtils.isNotNullOrBlank(msg)) {
      Get.showSnackbar(
          GetSnackBar(message: msg, duration: const Duration(seconds: 2)));
    }
  }

  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      webPosition: "center",
    );
  }
}
