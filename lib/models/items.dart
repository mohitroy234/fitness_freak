import 'package:flutter/material.dart';

class lessonsModel with ChangeNotifier {
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  lessonsModel(
      {this.createdAt,
        this.name,
        this.duration,
        this.category,
        this.locked,
        this.id});

  lessonsModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }
  static List<lessonsModel> lessonsFromSnapshot (List lessonSnapshot){
    return lessonSnapshot.map((data) {

      return lessonsModel.fromJson(data);
    }).toList();
  }
}