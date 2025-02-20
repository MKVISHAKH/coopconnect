import 'package:json_annotation/json_annotation.dart';

part 'sharedpref.g.dart';

@JsonSerializable()
class Sharedpref {
  String? status;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_code')
  String? socCode;
  @JsonKey(name: 'soc_name')
  String? socName;
  @JsonKey(name: 'mobile')
  String? mobile;
  String? email;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  @JsonKey(name: 'active')
  int? active;
  @JsonKey(name: 'access_token')
  String? accesstoken;

  Sharedpref({
    this.status,
    this.userId,
    this.socId,
    this.socCode,
    this.socName,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.active,
    this.accesstoken,
  });
  Sharedpref.value({
    this.status,
    this.userId,
    this.socId,
    this.socCode,
    this.socName,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.active,
    this.accesstoken,
  });

  factory Sharedpref.fromJson(Map<String, dynamic> json) {
    return _$SharedprefFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SharedprefToJson(this);
}
