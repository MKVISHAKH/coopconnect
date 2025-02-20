// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: (json['user_id'] as num?)?.toInt(),
      socId: (json['soc_id'] as num?)?.toInt(),
      socCode: json['soc_code'] as String?,
      socName: json['soc_name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      active: (json['active'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      updatedBy: json['modified_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['modified_date'] == null
          ? null
          : DateTime.parse(json['modified_date'] as String),
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user_id': instance.userId,
      'soc_id': instance.socId,
      'soc_code': instance.socCode,
      'active': instance.active,
      'soc_name': instance.socName,
      'mobile': instance.mobile,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_by': instance.createdBy,
      'modified_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_date': instance.updatedAt?.toIso8601String(),
      'access_token': instance.accessToken,
    };
