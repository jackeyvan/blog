import 'dart:convert';

import 'package:bolg_backend/api/base_api.dart';
import 'package:bolg_backend/const/constant.dart';
import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/model/user_model.dart';
import 'package:bolg_backend/utils/utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理
/// 如果本地和三方都失败，则使用成功状态，但是body没有数据

class V1Api extends BaseApi {
  @Route.post('/user/login')
  Future<Response> login(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final username = params["username"];
    final password = params["password"];

    /// 检查用户是否已经注册
    if (!HiveBox.userBox.containsKey(username)) {
      return failed(message: Constant.userDontHave);
    }

    final user = UserModel(
        nickname: username,
        username: username,
        password: password,
        token: Utils.jwtSign(username, password));

    await HiveBox.userBox.put(username, user);

    return success(user);
  }

  @Route.post('/user/info')
  Future<Response> fetchUserInfo(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final token = params["token"];
    if (Utils.jwtVerify(token)) {
      final user = Utils.getUserFromToken(token);
      if (user != null) {
        return success(user);
      }
    }
    return failed(message: Constant.tokenExpired);
  }

  Router get router => _$V1ApiRouter(this);
}
