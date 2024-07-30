/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/admin/admin_login.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'adminLogin': _i2.AdminLoginEndpoint()
        ..initialize(
          server,
          'adminLogin',
          null,
        )
    };
    connectors['adminLogin'] = _i1.EndpointConnector(
      name: 'adminLogin',
      endpoint: endpoints['adminLogin']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['adminLogin'] as _i2.AdminLoginEndpoint).login(
            session,
            params['account'],
            params['password'],
          ),
        ),
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['adminLogin'] as _i2.AdminLoginEndpoint).register(
            session,
            params['account'],
            params['password'],
          ),
        ),
      },
    );
  }
}
