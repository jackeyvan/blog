import 'package:blog_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// 管理后台登录
class AdminLoginEndpoint extends Endpoint {
  Future<AdminUser?> login(
      Session session, String account, String password) async {
    return await AdminUser.db.findFirstRow(session,
        where: (t) =>
            (t.account.equals(account)) & (t.password.equals(password)));
  }

  Future<AdminUser?> register(
      Session session, String account, String password) async {
    final user = await AdminUser.db.findFirstRow(session,
        where: (t) =>
            (t.account.equals(account)) & (t.password.equals(password)));

    if (user != null) return user;

    /// 插入数据库
    final newUser = await AdminUser.db
        .insertRow(session, AdminUser(account: account, password: password));
    return newUser;
  }
}
