import 'package:blog_flutter/app/routes/routes.dart';
import 'package:blog_flutter/core/page/base/base_controller.dart';
import 'package:blog_flutter/core/page/base/base_page.dart';
import 'package:blog_flutter/core/utils/core_utils.dart';
import 'package:blog_flutter/core/utils/overlay_utils.dart';
import 'package:blog_flutter/main.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: width * 0.3,
        height: height * 0.5,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              children: [
                const Text("个人博客管理后台", style: TextStyle(fontSize: 36)),
                const SizedBox(height: 72),
                TextField(controller: controller.accountController),
                const SizedBox(height: 42),
                TextField(controller: controller.passwordController),
                const SizedBox(height: 100),
                SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.login(),
                        child:
                            const Text("登录", style: TextStyle(fontSize: 20))))
              ],
            ),
          ),
        ),
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
      OverlayUtils.showSnackBar("账号或密码为空");
      return;
    }

    /// TODO 登录

    client.backendLogin.login(account, password).then((result) {
      print("------> ${result.data}");
    });

    Future.delayed(const Duration(seconds: 2), () {
      OverlayUtils.showSnackBar("登录成功");

      Get.toNamed(Routes.root);
    });
  }
}
