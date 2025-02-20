import 'package:json_annotation/json_annotation.dart';

part 'loginreq.g.dart';

@JsonSerializable()
class Loginreq {
  @JsonKey(name: 'soc_code')
  String? socCode;
  String? password;

  Loginreq({this.socCode, this.password});

  factory Loginreq.fromJson(Map<String, dynamic> json) {
    return _$LoginreqFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginreqToJson(this);
}
