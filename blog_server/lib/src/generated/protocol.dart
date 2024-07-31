/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'backend/backend_user.dart' as _i3;
import 'example.dart' as _i4;
import 'response.dart' as _i5;
import 'package:blog_shared/src/api_response.dart' as _i6;
export 'backend/backend_user.dart';
export 'example.dart';
export 'response.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'backend_user',
      dartName: 'BackendUser',
      schema: 'public',
      module: 'blog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'backend_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'account',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'backend_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.BackendUser) {
      return _i3.BackendUser.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.Response) {
      return _i5.Response.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.BackendUser?>()) {
      return (data != null ? _i3.BackendUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Response?>()) {
      return (data != null ? _i5.Response.fromJson(data) : null) as T;
    }
    if (t == _i6.ApiResponse) {
      return _i6.ApiResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i6.ApiResponse?>()) {
      return (data != null ? _i6.ApiResponse.fromJson(data) : null) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i6.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i3.BackendUser) {
      return 'BackendUser';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.Response) {
      return 'Response';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i6.ApiResponse>(data['data']);
    }
    if (data['className'] == 'BackendUser') {
      return deserialize<_i3.BackendUser>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'Response') {
      return deserialize<_i5.Response>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.BackendUser:
        return _i3.BackendUser.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'blog';
}
