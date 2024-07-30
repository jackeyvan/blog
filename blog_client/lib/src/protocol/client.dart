/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:blog_client/src/protocol/admin/admin_user.dart' as _i3;
import 'protocol.dart' as _i4;

/// 管理后台登录
/// {@category Endpoint}
class EndpointAdminLogin extends _i1.EndpointRef {
  EndpointAdminLogin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'adminLogin';

  _i2.Future<_i3.AdminUser?> login(
    String account,
    String password,
  ) =>
      caller.callServerEndpoint<_i3.AdminUser?>(
        'adminLogin',
        'login',
        {
          'account': account,
          'password': password,
        },
      );

  _i2.Future<_i3.AdminUser?> register(
    String account,
    String password,
  ) =>
      caller.callServerEndpoint<_i3.AdminUser?>(
        'adminLogin',
        'register',
        {
          'account': account,
          'password': password,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    adminLogin = EndpointAdminLogin(this);
  }

  late final EndpointAdminLogin adminLogin;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'adminLogin': adminLogin};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
