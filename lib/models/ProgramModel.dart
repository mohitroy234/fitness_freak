import 'package:api_fetch/models/program.dart';

class ProgramModel {
  String? requestId;
  List<programsModel>? items;
  int? count;
  String? anyKey;

  ProgramModel({this.requestId, this.items, this.count, this.anyKey});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    if (json['items'] != null) {
      items = <programsModel>[];
      json['items'].forEach((v) {
        items!.add(new programsModel.fromJson(v));
      });
    }
    count = json['count'];
    anyKey = json['anyKey'];
  }
}