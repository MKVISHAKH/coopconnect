import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_name')
  String? socName;
  @JsonKey(name: 'reg_no')
  String? regNo;
  @JsonKey(name: 'soc_class')
  String? socClass;
  String? classDet;
  @JsonKey(name: 'soc_type')
  int? socType;
  @JsonKey(name: 'soc_type_name')
  String? socTypeName;
  @JsonKey(name: 'society_code')
  String? societyCode;
  String? address;
  String? email;
  @JsonKey(name: 'district_id')
  int? districtId;
  @JsonKey(name: 'district_name')
  String? districtName;
  @JsonKey(name: 'taluk_id')
  int? talukId;
  @JsonKey(name: 'taluk_name')
  String? talukName;
  @JsonKey(name: 'unit_id')
  int? unitId;
  @JsonKey(name: 'unit_name')
  String? unitName;
  @JsonKey(name: 'imbp_amount')
  dynamic imbpAmount;
  int? status;
  List<Branch>? branches;

  Data({
    this.socId,
    this.socName,
    this.regNo,
    this.socClass,
    this.classDet,
    this.socType,
    this.socTypeName,
    this.societyCode,
    this.address,
    this.email,
    this.districtId,
    this.districtName,
    this.talukId,
    this.talukName,
    this.unitId,
    this.unitName,
    this.imbpAmount,
    this.status,
    this.branches,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
