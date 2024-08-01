import 'package:blog_server/src/const/api_status.dart';
import 'package:blog_server/src/generated/protocol.dart';
import 'package:blog_server/src/utils/log_utils.dart';
import 'package:blog_shared/blog_shared.dart';
import 'package:serverpod/serverpod.dart';

/// 管理后台登录
class AdminLoginEndpoint extends Endpoint {
  Future<ApiResponse> login(
      Session session, String account, String password) async {
    try {
      final user = await AdminUser.db
          .findFirstRow(session, where: (t) => t.account.equals(account));

      /// 用户不存在
      if (user == null) return responseFail(StatusMsg.userDonHave);

      /// 密码错误
      if (user.password != password) {
        return responseFail(StatusMsg.passwordWrong);
      }

      /// 登录成功
      return responseSuccess(user);
    } catch (e) {
      LogUtils.e(e.toString());
      return responseFail(StatusMsg.loginFail);
    }
  }

  Future<ApiResponse> register(
      Session session, String account, String password) async {
    try {
      final user = await AdminUser.db
          .findFirstRow(session, where: (t) => t.account.equals(account));

      if (user != null) return responseFail(StatusMsg.userAlreadyHave);

      /// 插入数据库
      final newUser = await AdminUser.db
          .insertRow(session, AdminUser(account: account, password: password));
      return responseSuccess(newUser);
    } catch (e) {
      LogUtils.e(e.toString());
      return responseFail(StatusMsg.registerFail);
    }
  }

  responseFail(String msg) =>
      ApiResponse(msg: msg, code: StatusCode.fail, data: null);

  responseSuccess(user) => ApiResponse(
      msg: StatusMsg.loginSuccess, code: StatusCode.success, data: user);
}
