import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class DatumVal {
  @JsonKey(name: 'scheduler_id')
  int? schedulerId;
  @JsonKey(name: 'inspection_id')
  int? inspectionId;
  @JsonKey(name: 'insp_number')
  String? inspNumber;
  @JsonKey(name: 'sch_date')
  String? schDate;
  @JsonKey(name: 'attended_date')
  String? attendedDate;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'inspected_by')
  String? inspectedBy;
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_name')
  String? socName;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'branch_name')
  String? branchName;
  int? status;

  DatumVal({
    this.schedulerId,
    this.inspectionId,
    this.inspNumber,
    this.schDate,
    this.attendedDate,
    this.userId,
    this.inspectedBy,
    this.socId,
    this.socName,
    this.branchId,
    this.branchName,
    this.status,
  });

  factory DatumVal.fromJson(Map<String, dynamic> json) =>
      _$DatumValFromJson(json);

  Map<String, dynamic> toJson() => _$DatumValToJson(this);
}
