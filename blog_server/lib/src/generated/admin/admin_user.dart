/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class AdminUser extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  AdminUser._({
    int? id,
    required this.account,
    required this.password,
  }) : super(id);

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

  static final t = AdminUserTable();

  static const db = AdminUserRepository._();

  String account;

  String password;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'account': account,
      'password': password,
    };
  }

  static AdminUserInclude include() {
    return AdminUserInclude._();
  }

  static AdminUserIncludeList includeList({
    _i1.WhereExpressionBuilder<AdminUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminUserTable>? orderByList,
    AdminUserInclude? include,
  }) {
    return AdminUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AdminUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AdminUser.t),
      include: include,
    );
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

class AdminUserTable extends _i1.Table {
  AdminUserTable({super.tableRelation}) : super(tableName: 'admin_user') {
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

class AdminUserInclude extends _i1.IncludeObject {
  AdminUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => AdminUser.t;
}

class AdminUserIncludeList extends _i1.IncludeList {
  AdminUserIncludeList._({
    _i1.WhereExpressionBuilder<AdminUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AdminUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => AdminUser.t;
}

class AdminUserRepository {
  const AdminUserRepository._();

  Future<List<AdminUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AdminUser>(
      where: where?.call(AdminUser.t),
      orderBy: orderBy?.call(AdminUser.t),
      orderByList: orderByList?.call(AdminUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<AdminUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<AdminUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AdminUser>(
      where: where?.call(AdminUser.t),
      orderBy: orderBy?.call(AdminUser.t),
      orderByList: orderByList?.call(AdminUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<AdminUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AdminUser>(
      id,
      transaction: transaction,
    );
  }

  Future<List<AdminUser>> insert(
    _i1.Session session,
    List<AdminUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AdminUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AdminUser> insertRow(
    _i1.Session session,
    AdminUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AdminUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AdminUser>> update(
    _i1.Session session,
    List<AdminUser> rows, {
    _i1.ColumnSelections<AdminUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AdminUser>(
      rows,
      columns: columns?.call(AdminUser.t),
      transaction: transaction,
    );
  }

  Future<AdminUser> updateRow(
    _i1.Session session,
    AdminUser row, {
    _i1.ColumnSelections<AdminUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AdminUser>(
      row,
      columns: columns?.call(AdminUser.t),
      transaction: transaction,
    );
  }

  Future<List<AdminUser>> delete(
    _i1.Session session,
    List<AdminUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AdminUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AdminUser> deleteRow(
    _i1.Session session,
    AdminUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AdminUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AdminUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AdminUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AdminUser>(
      where: where(AdminUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AdminUser>(
      where: where?.call(AdminUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
