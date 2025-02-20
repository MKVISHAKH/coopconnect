// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeReq _$ChangeReqFromJson(Map<String, dynamic> json) => ChangeReq(
      socCode: json['soc_code'] as String?,
      refId: (json['ref_id'] as num?)?.toInt(),
      otp: json['otp'] as String?,
      userId: json['user_id'] as String?,
      password: json['password'] as String?,
      newPassword: json['new_password'] as String?,
      retypePassword: json['retype_password'] as String?,
      mobNo: json['mobNo'] as String?,
    );

Map<String, dynamic> _$ChangeReqToJson(ChangeReq instance) => <String, dynamic>{
      'soc_code': instance.socCode,
      'user_id': instance.userId,
      'ref_id': instance.refId,
      'otp': instance.otp,
      'password': instance.password,
      'new_password': instance.newPassword,
      'retype_password': instance.retypePassword,
      'mobNo': instance.mobNo,
    };
