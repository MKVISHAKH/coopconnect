import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'branch_cat_id')
  int? branchCatId;
  @JsonKey(name: 'branch_cat_name')
  String? branchCatName;
  @JsonKey(name: 'branch_name')
  String? branchName;
  int? active;

  Branch({
    this.branchId,
    this.branchCatId,
    this.branchCatName,
    this.branchName,
    this.active,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return _$BranchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
