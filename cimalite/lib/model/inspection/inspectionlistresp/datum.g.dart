// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      schedulerId: (json['scheduler_id'] as num?)?.toInt(),
      inspectionId: (json['inspection_id'] as num?)?.toInt(),
      inspNumber: json['insp_number'] as String?,
      inspectedBy: json['inspected_by'] as String?,
      actionStatus: json['mobile_disp_status'] as String?,
      schDate: json['sch_date'] as String?,
      attendedDate: json['attended_date'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      socId: (json['soc_id'] as num?)?.toInt(),
      socName: json['soc_name'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      branchName: json['branch_name'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'scheduler_id': instance.schedulerId,
      'inspection_id': instance.inspectionId,
      'insp_number': instance.inspNumber,
      'inspected_by': instance.inspectedBy,
      'mobile_disp_status':instance.actionStatus,
      'sch_date': instance.schDate,
      'attended_date': instance.attendedDate,
      'user_id': instance.userId,
      'soc_id': instance.socId,
      'soc_name': instance.socName,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'status': instance.status,
    };
