import 'package:blog_server/src/future_calls/admin_user_future_call.dart';
import 'package:blog_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  schedule(pod);

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
}

///  任务调度
void schedule(Serverpod pod) {
  final scheduleName = "adminUserSchedule";
  pod.registerFutureCall(AdminUserFutureCall(), scheduleName);

  /// 启动服务后，启动一个后台任务去初始化管理员
  pod.futureCallWithDelay(scheduleName, null, Duration(seconds: 5));
}
