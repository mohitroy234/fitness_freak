import 'package:api_fetch/models/items.dart';


class LessonModel {
  String? requestId;
  List<lessonsModel>? items;
  int? count;
  String? anyKey;

  LessonModel({this.requestId, this.items, this.count, this.anyKey});

  LessonModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    if (json['items'] != null) {
      items = <lessonsModel>[];
      json['items'].forEach((v) {
        items!.add(new lessonsModel.fromJson(v));
      });
    }
    count = json['count'];
    anyKey = json['anyKey'];
  }
}
