import 'dart:convert';

import 'package:collection/collection.dart';

class Users {
  final int? ownerId;
  final int? shopId;
  final int? userId;
  final String? gId;
  final String? userName;
  final String? userFullname;
  final String? address;
  final String? phone;
  final double? cusCk;
  final String? createTime;
  final int? createBy;
  final String? updateTime;
  final int? updateBy;
  final int? sts;

  const Users({
    this.ownerId,
    this.shopId,
    this.userId,
    this.gId,
    this.userName,
    this.userFullname,
    this.address,
    this.phone,
    this.cusCk,
    this.createTime,
    this.createBy,
    this.updateTime,
    this.updateBy,
    this.sts,
  });

  @override
  String toString() {
    return 'Users(ownerId: $ownerId, shopId: $shopId, userId: $userId, gId: $gId, userName: $userName, userFullname: $userFullname, address: $address, phone: $phone, cusCk: $cusCk, createTime: $createTime, createBy: $createBy, updateTime: $updateTime, updateBy: $updateBy, sts: $sts)';
  }

  factory Users.fromMap(Map<String, dynamic> data) => Users(
        ownerId: data['owner_id'] as int?,
        shopId: data['shop_id'] as int?,
        userId: data['user_id'] as int?,
        gId: data['g_id'] as String?,
        userName: data['user_name'] as String?,
        userFullname: data['user_fullname'] as String?,
        address: data['address'] as String?,
        phone: data['phone'] as String?,
        cusCk: data['cus_ck'].toDouble(),
        createTime: data['create_time'] as String?,
        createBy: data['create_by'] as int?,
        updateTime: data['update_time'] as String?,
        updateBy: data['update_by'] as int?,
        sts: data['sts'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'owner_id': ownerId,
        'shop_id': shopId,
        'user_id': userId,
        'g_id': gId,
        'user_name': userName,
        'user_fullname': userFullname,
        'address': address,
        'phone': phone,
        'cus_ck': cusCk,
        'create_time': createTime,
        'create_by': createBy,
        'update_time': updateTime,
        'update_by': updateBy,
        'sts': sts,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Users].
  factory Users.fromJson(String data) {
    print("Users.fromJson ");

    return Users.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Users] to a JSON string.
  String toJson() => json.encode(toMap());

  Users copyWith({
    int? ownerId,
    int? shopId,
    int? userId,
    String? gId,
    String? userName,
    String? userFullname,
    String? address,
    String? phone,
    double? cusCk,
    String? createTime,
    int? createBy,
    String? updateTime,
    int? updateBy,
    int? sts,
  }) {
    return Users(
      ownerId: ownerId ?? this.ownerId,
      shopId: shopId ?? this.shopId,
      userId: userId ?? this.userId,
      gId: gId ?? this.gId,
      userName: userName ?? this.userName,
      userFullname: userFullname ?? this.userFullname,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      cusCk: cusCk ?? this.cusCk,
      createTime: createTime ?? this.createTime,
      createBy: createBy ?? this.createBy,
      updateTime: updateTime ?? this.updateTime,
      updateBy: updateBy ?? this.updateBy,
      sts: sts ?? this.sts,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Users) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      ownerId.hashCode ^
      shopId.hashCode ^
      userId.hashCode ^
      gId.hashCode ^
      userName.hashCode ^
      userFullname.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      cusCk.hashCode ^
      createTime.hashCode ^
      createBy.hashCode ^
      updateTime.hashCode ^
      updateBy.hashCode ^
      sts.hashCode;
}

class ListUsers {
  var listdata = <Users>[];
}
