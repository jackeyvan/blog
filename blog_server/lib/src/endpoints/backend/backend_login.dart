import 'package:blog_server/src/const/api_status.dart';
import 'package:blog_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// 管理后台登录
class BackendLogin extends Endpoint {
  Future<Response> login(
      Session session, String account, String password) async {
    final user = await BackendUser.db
        .findFirstRow(session, where: (t) => t.account.equals(account));

    if (user != null) {
      return Response(
          code: StatusCode.success,
          msg: StatusMsg.loginSuccess,
          data: user.toString());
    }
    return Response(
        code: StatusCode.fail, msg: StatusMsg.loginFail, data: null);
  }

  Future<Response> register(
      Session session, String account, String password) async {
    final user = await BackendUser.db
        .findFirstRow(session, where: (t) => t.account.equals(account));

    if (user != null) {
      return Response(
          code: StatusCode.fail, msg: StatusMsg.userAlreadyHave, data: null);
    }

    /// 插入数据库
    final newUser = await BackendUser.db
        .insertRow(session, BackendUser(account: account, password: password));
    return Response(
        code: StatusCode.success,
        msg: StatusMsg.loginFail,
        data: newUser.toString());
  }
}
