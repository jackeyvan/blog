import 'dart:convert';

import 'package:bolg_backend/api/base_api.dart';
import 'package:bolg_backend/const/constant.dart';
import 'package:bolg_backend/db/hive_box.dart';
import 'package:bolg_backend/model/blog.dart';
import 'package:bolg_backend/model/bookmark.dart';
import 'package:bolg_backend/utils/utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理
/// 如果本地和三方都失败，则使用成功状态，但是body没有数据

class V1Api extends BaseApi {
  Router get router => _$V1ApiRouter(this);

  @Route.post('/user/login')
  Future<Response> login(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final username = params["username"];
    final password = params["password"];

    /// 检查用户状态
    final dbUser = HiveBox.userBox.get(username);
    if (dbUser == null || dbUser.password != password) {
      return failed(message: Constant.userPasswordWrong);
    }

    /// 更新token
    dbUser.token = Utils.jwtSign(username, password);
    HiveBox.userBox.put(username, dbUser);

    return success(dbUser);
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

  @Route.post('/bookmark/tabs')
  Future<Response> fetchBookmarkTabs(Request request) async {
    return success(HiveBox.bookmarkTypeBox.values.toList());
  }

  @Route.post('/bookmark/add')
  Future<Response> addBookmark(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final bookmark = Bookmark.fromJson(params);
    await HiveBox.bookmarkBox.add(bookmark);
    return success(bookmark);
  }

  @Route.post('/bookmark/list')
  Future<Response> fetchBookmarks(Request request) async {
    return success(HiveBox.bookmarkBox.values.toList());
  }

  @Route.post('/blog/list')
  Future<Response> fetchBlogs(Request request) async {
    return success(HiveBox.blogBox.values.toList());
  }

  @Route.post('/blog/add')
  Future<Response> addBlogs(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final blog = Blog.fromJson(params);

    blog.saveTagAndCategory();

    await HiveBox.blogBox.add(blog);
    return success(blog);
  }

  @Route.post('/blog/tags')
  Future<Response> fetchBlogTags(Request request) async {
    return success(HiveBox.blogTagBox.values.toList());
  }

  @Route.post('/blog/category')
  Future<Response> fetchBlogCategory(Request request) async {
    return success(HiveBox.blogCategoryBox.values.toList());
  }
}
