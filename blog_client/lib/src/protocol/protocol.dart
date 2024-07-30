/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'backend/backend_user.dart' as _i2;
import 'example.dart' as _i3;
import 'response.dart' as _i4;
export 'backend/backend_user.dart';
export 'example.dart';
export 'response.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.BackendUser) {
      return _i2.BackendUser.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.Response) {
      return _i4.Response.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.BackendUser?>()) {
      return (data != null ? _i2.BackendUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Response?>()) {
      return (data != null ? _i4.Response.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.BackendUser) {
      return 'BackendUser';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Response) {
      return 'Response';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'BackendUser') {
      return deserialize<_i2.BackendUser>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'Response') {
      return deserialize<_i4.Response>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
