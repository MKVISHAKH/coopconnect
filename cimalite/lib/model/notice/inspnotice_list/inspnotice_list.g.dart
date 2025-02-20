// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspnotice_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspnoticeList _$InspnoticeListFromJson(Map<String, dynamic> json) =>
    InspnoticeList(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumVal.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InspnoticeListToJson(InspnoticeList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
