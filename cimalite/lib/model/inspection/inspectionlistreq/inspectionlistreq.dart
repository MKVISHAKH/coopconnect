import 'package:json_annotation/json_annotation.dart';

part 'inspectionlistreq.g.dart';

@JsonSerializable()
class Inspectionlistreq {
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'inspection_id')
  int? inspectionId;
  String? fromdt;
  String? todt;

  Inspectionlistreq(
      {this.socId, this.branchId, this.inspectionId, this.fromdt, this.todt});

  factory Inspectionlistreq.fromJson(Map<String, dynamic> json) {
    return _$InspectionlistreqFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionlistreqToJson(this);
}
