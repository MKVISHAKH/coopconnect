// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'society_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocietyProfile _$SocietyProfileFromJson(Map<String, dynamic> json) =>
    SocietyProfile(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SocietyProfileToJson(SocietyProfile instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
