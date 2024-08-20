import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理
/// 如果本地和三方都失败，则使用成功状态，但是body没有数据

class V1Api {
  @Route.get('/banner')
  Future<Response> fetchBanner(Request request) async {
    return Response.ok({"banner": "success"});
  }

  Router get router => _$V1ApiRouter(this);
}
