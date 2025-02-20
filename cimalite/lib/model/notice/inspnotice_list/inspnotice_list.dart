import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'inspnotice_list.g.dart';

@JsonSerializable()
class InspnoticeList {
  String? status;
  List<DatumVal>? data;
  String? message;

  InspnoticeList({this.status, this.data, this.message});

  factory InspnoticeList.fromJson(Map<String, dynamic> json) {
    return _$InspnoticeListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspnoticeListToJson(this);
}
