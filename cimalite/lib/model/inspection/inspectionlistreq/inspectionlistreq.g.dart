// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspectionlistreq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspectionlistreq _$InspectionlistreqFromJson(Map<String, dynamic> json) =>
    Inspectionlistreq(
      socId: (json['soc_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      inspectionId: (json['inspection_id'] as num?)?.toInt(),
      fromdt: json['fromdt'] as String?,
      todt: json['todt'] as String?,
    );

Map<String, dynamic> _$InspectionlistreqToJson(Inspectionlistreq instance) =>
    <String, dynamic>{
      'soc_id': instance.socId,
      'branch_id': instance.branchId,
      'inspection_id': instance.inspectionId,
      'fromdt': instance.fromdt,
      'todt': instance.todt,
    };
