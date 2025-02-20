import 'package:json_annotation/json_annotation.dart';

import 'notice.dart';

part 'datum.g.dart';

@JsonSerializable()
class DatumValue {
  @JsonKey(name: 'inspection_id')
  int? inspectionId;
  @JsonKey(name: 'soc_id')
  int? socId;
  @JsonKey(name: 'soc_name')
  String? socName;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'branch_name')
  String? branchName;
  @JsonKey(name: 'insp_user_id')
  int? inspUserId;
  @JsonKey(name: 'inspected_by')
  String? inspectedBy;
  @JsonKey(name: 'insp_number')
  String? inspNo;
  @JsonKey(name: 'inspection_date')
  String? inspectionDate;
  @JsonKey(name: 'approve_date')
  String? approveDate;
  @JsonKey(name: 'approved_by')
  dynamic approvedBy;
  String? remarks;
  @JsonKey(name: 'notice_status')
  int? noticeStatus;
  @JsonKey(name: 'notice_date')
  String? noticeDate;
  @JsonKey(name: 'notice_generated_by')
  dynamic noticeGeneratedBy;
  @JsonKey(name: 'notice_remarks')
  String? noticeRemarks;
  List<Notice>? notices;

  DatumValue({
    this.inspectionId,
    this.socId,
    this.socName,
    this.branchId,
    this.branchName,
    this.inspUserId,
    this.inspectedBy,
    this.inspNo,
    this.inspectionDate,
    this.approveDate,
    this.approvedBy,
    this.remarks,
    this.noticeStatus,
    this.noticeDate,
    this.noticeGeneratedBy,
    this.noticeRemarks,
    this.notices,
  });

  factory DatumValue.fromJson(Map<String, dynamic> json) =>
      _$DatumValueFromJson(json);

  Map<String, dynamic> toJson() => _$DatumValueToJson(this);
}
