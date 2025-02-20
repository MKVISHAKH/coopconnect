import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'scheduler_id')
  int? schedulerId;
  @JsonKey(name: 'inspection_id')
  int? inspectionId;
  @JsonKey(name: 'insp_number')
  String? inspNumber;
  @JsonKey(name: 'inspected_by')
  String? inspectedBy;
  @JsonKey(name: 'sch_date')
  String? schDate;
  @JsonKey(name: 'attended_date')
  String? attendedDate;
  @JsonKey(name: 'mobile_disp_status')
  String? actionStatus;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_name')
  String? socName;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'branch_name')
  String? branchName;
  int? status;

  Datum({
    this.schedulerId,
    this.inspectionId,
    this.inspNumber,
    this.inspectedBy,
    this.schDate,
    this.attendedDate,
    this.actionStatus,
    this.userId,
    this.socId,
    this.socName,
    this.branchId,
    this.branchName,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
