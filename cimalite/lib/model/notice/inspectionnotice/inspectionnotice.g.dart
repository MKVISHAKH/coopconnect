// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspectionnotice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspectionnotice _$InspectionnoticeFromJson(Map<String, dynamic> json) =>
    Inspectionnotice(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InspectionnoticeToJson(Inspectionnotice instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
