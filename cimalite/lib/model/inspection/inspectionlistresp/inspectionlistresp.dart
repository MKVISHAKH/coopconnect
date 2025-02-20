import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'inspectionlistresp.g.dart';

@JsonSerializable()
class Inspectionlistresp {
  String? status;
  List<Datum>? data;
  String? message;

  Inspectionlistresp({this.status, this.data, this.message});

  factory Inspectionlistresp.fromJson(Map<String, dynamic> json) {
    return _$InspectionlistrespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionlistrespToJson(this);
}
