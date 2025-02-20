// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharedpref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sharedpref _$SharedprefFromJson(Map<String, dynamic> json) => Sharedpref(
      status: json['status'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      socId: (json['soc_id'] as num?)?.toInt(),
      socCode: json['soc_code'] as String?,
      socName: json['soc_name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      active: (json['active'] as num?)?.toInt(),
      accesstoken: json['access_token'] as String?,
    );

Map<String, dynamic> _$SharedprefToJson(Sharedpref instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user_id': instance.userId,
      'soc_id': instance.socId,
      'soc_code': instance.socCode,
      'soc_name': instance.socName,
      'mobile': instance.mobile,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'active': instance.active,
      'access_token': instance.accesstoken,
    };
