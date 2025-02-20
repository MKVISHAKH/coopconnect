import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_code')
  String? socCode;
  int? active;
  @JsonKey(name: 'soc_name')
  String? socName;
  String? mobile;
  String? email;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'modified_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'modified_date')
  DateTime? updatedAt;
  @JsonKey(name: 'access_token')
  String? accessToken;

  Data({
    this.userId,
    this.socId,
    this.socCode,
    this.socName,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.active,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
