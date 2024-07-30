/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AdminUser implements _i1.SerializableModel {
  AdminUser._({
    this.id,
    required this.account,
    required this.password,
  });

  factory AdminUser({
    int? id,
    required String account,
    required String password,
  }) = _AdminUserImpl;

  factory AdminUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AdminUser(
      id: jsonSerialization['id'] as int?,
      account: jsonSerialization['account'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String account;

  String password;

  AdminUser copyWith({
    int? id,
    String? account,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'account': account,
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminUserImpl extends AdminUser {
  _AdminUserImpl({
    int? id,
    required String account,
    required String password,
  }) : super._(
          id: id,
          account: account,
          password: password,
        );

  @override
  AdminUser copyWith({
    Object? id = _Undefined,
    String? account,
    String? password,
  }) {
    return AdminUser(
      id: id is int? ? id : this.id,
      account: account ?? this.account,
      password: password ?? this.password,
    );
  }
}
