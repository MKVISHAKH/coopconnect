// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspectionlistresp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspectionlistresp _$InspectionlistrespFromJson(Map<String, dynamic> json) =>
    Inspectionlistresp(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InspectionlistrespToJson(Inspectionlistresp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
