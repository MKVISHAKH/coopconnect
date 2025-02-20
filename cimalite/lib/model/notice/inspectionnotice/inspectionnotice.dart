import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'inspectionnotice.g.dart';

@JsonSerializable()
class Inspectionnotice {
  String? status;
  List<DatumValue>? data;
  String? message;

  Inspectionnotice({this.status, this.data, this.message});

  factory Inspectionnotice.fromJson(Map<String, dynamic> json) {
    return _$InspectionnoticeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionnoticeToJson(this);
}
