import 'dart:convert';

import 'package:collection/collection.dart';

class Shop {
  final int? ownerId;
  final String? ownerName;
  final dynamic configuration;
  final String? printHeader;
  final String? printFooter;
  final String? createTime;
  final int? createBy;
  final String? updateTime;
  final int? updateBy;
  final int? sts;

  const Shop({
    this.ownerId,
    this.ownerName,
    this.configuration,
    this.printHeader,
    this.printFooter,
    this.createTime,
    this.createBy,
    this.updateTime,
    this.updateBy,
    this.sts,
  });

  @override
  String toString() {
    return 'Shop(ownerId: $ownerId, ownerName: $ownerName, configuration: $configuration, printHeader: $printHeader, printFooter: $printFooter, createTime: $createTime, createBy: $createBy, updateTime: $updateTime, updateBy: $updateBy, sts: $sts)';
  }

  factory Shop.fromMap(Map<String, dynamic> data) => Shop(
        ownerId: data['owner_id'] as int?,
        ownerName: data['owner_name'] as String?,
        configuration: data['configuration'] as dynamic,
        printHeader: data['print_header'] as String?,
        printFooter: data['print_footer'] as String?,
        createTime: data['create_time'] as String?,
        createBy: data['create_by'] as int?,
        updateTime: data['update_time'] as String?,
        updateBy: data['update_by'] as int?,
        sts: data['sts'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'owner_id': ownerId,
        'owner_name': ownerName,
        'configuration': configuration,
        'print_header': printHeader,
        'print_footer': printFooter,
        'create_time': createTime,
        'create_by': createBy,
        'update_time': updateTime,
        'update_by': updateBy,
        'sts': sts,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Shop].
  factory Shop.fromJson(String data) {
    return Shop.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Shop] to a JSON string.
  String toJson() => json.encode(toMap());

  Shop copyWith({
    int? ownerId,
    String? ownerName,
    dynamic configuration,
    String? printHeader,
    String? printFooter,
    String? createTime,
    int? createBy,
    String? updateTime,
    int? updateBy,
    int? sts,
  }) {
    return Shop(
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      configuration: configuration ?? this.configuration,
      printHeader: printHeader ?? this.printHeader,
      printFooter: printFooter ?? this.printFooter,
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
    if (other is! Shop) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      ownerId.hashCode ^
      ownerName.hashCode ^
      configuration.hashCode ^
      printHeader.hashCode ^
      printFooter.hashCode ^
      createTime.hashCode ^
      createBy.hashCode ^
      updateTime.hashCode ^
      updateBy.hashCode ^
      sts.hashCode;
}
