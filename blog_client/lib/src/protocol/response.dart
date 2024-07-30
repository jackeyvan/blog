/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Response implements _i1.SerializableModel {
  Response._({
    required this.msg,
    required this.code,
    this.data,
  });

  factory Response({
    required String msg,
    required int code,
    String? data,
  }) = _ResponseImpl;

  factory Response.fromJson(Map<String, dynamic> jsonSerialization) {
    return Response(
      msg: jsonSerialization['msg'] as String,
      code: jsonSerialization['code'] as int,
      data: jsonSerialization['data'] as String?,
    );
  }

  String msg;

  int code;

  String? data;

  Response copyWith({
    String? msg,
    int? code,
    String? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'code': code,
      if (data != null) 'data': data,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResponseImpl extends Response {
  _ResponseImpl({
    required String msg,
    required int code,
    String? data,
  }) : super._(
          msg: msg,
          code: code,
          data: data,
        );

  @override
  Response copyWith({
    String? msg,
    int? code,
    Object? data = _Undefined,
  }) {
    return Response(
      msg: msg ?? this.msg,
      code: code ?? this.code,
      data: data is String? ? data : this.data,
    );
  }
}
