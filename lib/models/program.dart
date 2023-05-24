import 'package:flutter/material.dart';

class programsModel with ChangeNotifier{
  String? createdAt;
  String? name;
  String? category;
  int? lesson;
  String? id;
  String? userName;
  String? mobileNo;
  String? emailId;
  String? city;
  String? password;

  programsModel(
      {this.createdAt,
        this.name,
        this.category,
        this.lesson,
        this.id,
        this.userName,
        this.mobileNo,
        this.emailId,
        this.city,
        this.password});

  programsModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    category = json['category'];
    lesson = json['lesson'];
    id = json['id'];
    userName = json['userName'];
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    city = json['city'];
    password = json['password'];
  }
  static List<programsModel> programsFromSnapshot (List programSnapshot){
    return programSnapshot.map((data) {

      return programsModel.fromJson(data);
    }).toList();
  }
}