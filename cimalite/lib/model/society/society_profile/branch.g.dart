// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      branchId: (json['branch_id'] as num?)?.toInt(),
      branchCatId: (json['branch_cat_id'] as num?)?.toInt(),
      branchCatName: json['branch_cat_name'] as String?,
      branchName: json['branch_name'] as String?,
      active: (json['active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'branch_id': instance.branchId,
      'branch_cat_id': instance.branchCatId,
      'branch_cat_name': instance.branchCatName,
      'branch_name': instance.branchName,
      'active': instance.active,
    };
