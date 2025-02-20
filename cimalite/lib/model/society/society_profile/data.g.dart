// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      socId: (json['soc_id'] as num?)?.toInt(),
      socName: json['soc_name'] as String?,
      regNo: json['reg_no'] as String?,
      socClass: json['soc_class'] as String?,
      socType: (json['soc_type'] as num?)?.toInt(),
      socTypeName: json['soc_type_name'] as String?,
      societyCode: json['society_code'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      districtId: (json['district_id'] as num?)?.toInt(),
      districtName: json['district_name'] as String?,
      talukId: (json['taluk_id'] as num?)?.toInt(),
      talukName: json['taluk_name'] as String?,
      unitId: (json['unit_id'] as num?)?.toInt(),
      unitName: json['unit_name'] as String?,
      imbpAmount: (json['imbp_amount'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'soc_id': instance.socId,
      'soc_name': instance.socName,
      'reg_no': instance.regNo,
      'soc_class': instance.socClass,
      'soc_type': instance.socType,
      'soc_type_name': instance.socTypeName,
      'society_code': instance.societyCode,
      'address': instance.address,
      'email': instance.email,
      'district_id': instance.districtId,
      'district_name': instance.districtName,
      'taluk_id': instance.talukId,
      'taluk_name': instance.talukName,
      'unit_id': instance.unitId,
      'unit_name': instance.unitName,
      'imbp_amount': instance.imbpAmount,
      'status': instance.status,
      'branches': instance.branches,
    };
