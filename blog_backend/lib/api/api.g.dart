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
    r'/bookmark/tabs/add',
    service.addBookmarkTab,
  );
  return router;
}
