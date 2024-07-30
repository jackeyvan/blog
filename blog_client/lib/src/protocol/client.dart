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
import 'package:blog_client/src/protocol/response.dart' as _i3;
import 'protocol.dart' as _i4;

/// 管理后台登录
/// {@category Endpoint}
class EndpointBackendLogin extends _i1.EndpointRef {
  EndpointBackendLogin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'backendLogin';

  _i2.Future<_i3.Response> login(
    String account,
    String password,
  ) =>
      caller.callServerEndpoint<_i3.Response>(
        'backendLogin',
        'login',
        {
          'account': account,
          'password': password,
        },
      );

  _i2.Future<_i3.Response> register(
    String account,
    String password,
  ) =>
      caller.callServerEndpoint<_i3.Response>(
        'backendLogin',
        'register',
        {
          'account': account,
          'password': password,
        },
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
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
    backendLogin = EndpointBackendLogin(this);
    example = EndpointExample(this);
  }

  late final EndpointBackendLogin backendLogin;

  late final EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'backendLogin': backendLogin,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
