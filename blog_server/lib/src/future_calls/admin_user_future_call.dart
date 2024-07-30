import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

final admin = "admin";
final password = "123456";

class AdminUserFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    final user = await AdminUser.db
        .findFirstRow(session, where: (t) => t.account.equals(admin));

    if (user != null) {
      print("Find admin user, name:${user.account}, password:${user.password}");
      return;
    }

    /// 插入数据库
    final newUser = await AdminUser.db
        .insertRow(session, AdminUser(account: admin, password: password));

    print(
        "Create user success, name:${newUser.account}, password:${newUser.password}");
  }
}
