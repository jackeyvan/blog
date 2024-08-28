// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$V1ApiRouter(V1Api service) {
  final router = Router();
  router.add(
    'POST',
    r'/user/login',
    service.login,
  );
  router.add(
    'POST',
    r'/user/info',
    service.fetchUserInfo,
  );
  router.add(
    'POST',
    r'/bookmark/tabs',
    service.fetchBookmarkTabs,
  );
  router.add(
    'POST',
    r'/bookmark/create',
    service.crateBookmark,
  );
  router.add(
    'POST',
    r'/bookmark/list',
    service.fetchBookmarks,
  );
  router.add(
    'POST',
    r'/blog/list',
    service.fetchBlogs,
  );
  router.add(
    'POST',
    r'/blog/create',
    service.crateBlog,
  );
  router.add(
    'POST',
    r'/blog/tags',
    service.fetchBlogTags,
  );
  router.add(
    'POST',
    r'/blog/category',
    service.fetchBlogCategory,
  );
  return router;
}
