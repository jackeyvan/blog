/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class BackendUser extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  BackendUser._({
    int? id,
    required this.account,
    required this.password,
  }) : super(id);

  factory BackendUser({
    int? id,
    required String account,
    required String password,
  }) = _BackendUserImpl;

  factory BackendUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return BackendUser(
      id: jsonSerialization['id'] as int?,
      account: jsonSerialization['account'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  static final t = BackendUserTable();

  static const db = BackendUserRepository._();

  String account;

  String password;

  @override
  _i1.Table get table => t;

  BackendUser copyWith({
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'account': account,
      'password': password,
    };
  }

  static BackendUserInclude include() {
    return BackendUserInclude._();
  }

  static BackendUserIncludeList includeList({
    _i1.WhereExpressionBuilder<BackendUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BackendUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BackendUserTable>? orderByList,
    BackendUserInclude? include,
  }) {
    return BackendUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BackendUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BackendUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BackendUserImpl extends BackendUser {
  _BackendUserImpl({
    int? id,
    required String account,
    required String password,
  }) : super._(
          id: id,
          account: account,
          password: password,
        );

  @override
  BackendUser copyWith({
    Object? id = _Undefined,
    String? account,
    String? password,
  }) {
    return BackendUser(
      id: id is int? ? id : this.id,
      account: account ?? this.account,
      password: password ?? this.password,
    );
  }
}

class BackendUserTable extends _i1.Table {
  BackendUserTable({super.tableRelation}) : super(tableName: 'backend_user') {
    account = _i1.ColumnString(
      'account',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
  }

  late final _i1.ColumnString account;

  late final _i1.ColumnString password;

  @override
  List<_i1.Column> get columns => [
        id,
        account,
        password,
      ];
}

class BackendUserInclude extends _i1.IncludeObject {
  BackendUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => BackendUser.t;
}

class BackendUserIncludeList extends _i1.IncludeList {
  BackendUserIncludeList._({
    _i1.WhereExpressionBuilder<BackendUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BackendUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => BackendUser.t;
}

class BackendUserRepository {
  const BackendUserRepository._();

  Future<List<BackendUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BackendUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BackendUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BackendUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BackendUser>(
      where: where?.call(BackendUser.t),
      orderBy: orderBy?.call(BackendUser.t),
      orderByList: orderByList?.call(BackendUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<BackendUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BackendUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<BackendUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BackendUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BackendUser>(
      where: where?.call(BackendUser.t),
      orderBy: orderBy?.call(BackendUser.t),
      orderByList: orderByList?.call(BackendUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<BackendUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BackendUser>(
      id,
      transaction: transaction,
    );
  }

  Future<List<BackendUser>> insert(
    _i1.Session session,
    List<BackendUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BackendUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<BackendUser> insertRow(
    _i1.Session session,
    BackendUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BackendUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BackendUser>> update(
    _i1.Session session,
    List<BackendUser> rows, {
    _i1.ColumnSelections<BackendUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BackendUser>(
      rows,
      columns: columns?.call(BackendUser.t),
      transaction: transaction,
    );
  }

  Future<BackendUser> updateRow(
    _i1.Session session,
    BackendUser row, {
    _i1.ColumnSelections<BackendUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BackendUser>(
      row,
      columns: columns?.call(BackendUser.t),
      transaction: transaction,
    );
  }

  Future<List<BackendUser>> delete(
    _i1.Session session,
    List<BackendUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BackendUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<BackendUser> deleteRow(
    _i1.Session session,
    BackendUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BackendUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BackendUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BackendUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BackendUser>(
      where: where(BackendUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BackendUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BackendUser>(
      where: where?.call(BackendUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
