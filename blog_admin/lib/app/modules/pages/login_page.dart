import 'dart:ui';

import 'package:blog_flutter/app/api/admin_repository.dart';
import 'package:blog_flutter/app/routes/routes.dart';
import 'package:blog_flutter/core/page/base/base_controller.dart';
import 'package:blog_flutter/core/page/base/base_page.dart';
import 'package:blog_flutter/core/utils/core_utils.dart';
import 'package:blog_flutter/core/utils/overlay_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginPage extends BasePage<LoginController> {
  const LoginPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("/images/bg_login.png"), fit: BoxFit.fill)),
        constraints: constraints,
        alignment: Alignment.center,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("个人博客管理后台", style: TextStyle(fontSize: 32)),
                      const SizedBox(height: 60),
                      TextField(controller: controller.accountController),
                      const SizedBox(height: 42),
                      TextField(controller: controller.passwordController),
                      const SizedBox(height: 60),
                      SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => controller.login(),
                              child: const Text("登录",
                                  style: TextStyle(fontSize: 20))))
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class LoginController extends BaseController {
  final accountController = TextEditingController(text: "admin");
  final passwordController = TextEditingController(text: "123456");

  /// 登录
  void login() {
    final account = accountController.text;
    final password = passwordController.text;

    if (CoreUtils.isNullOrBlank(account) || CoreUtils.isNullOrBlank(password)) {
      OverlayUtils.showToast("账号或密码为空");
      return;
    }

    AdminRepository.login(account, password).then((user) {
      if (user != null) {
        OverlayUtils.showToast("登录成功");
        Get.toNamed(Routes.root);
      } else {
        OverlayUtils.showToast("登录失败，请重试");
      }
    }).catchError((e, s) {
      OverlayUtils.showToast(e.toString());
    });
  }
}
