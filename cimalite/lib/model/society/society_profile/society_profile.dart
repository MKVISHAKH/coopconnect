import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'society_profile.g.dart';

@JsonSerializable()
class SocietyProfile {
  String? status;
  Data? data;
  String? message;

  SocietyProfile({this.status, this.data, this.message});

  factory SocietyProfile.fromJson(Map<String, dynamic> json) {
    return _$SocietyProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocietyProfileToJson(this);
}
