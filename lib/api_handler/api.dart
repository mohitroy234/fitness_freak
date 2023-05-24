import 'dart:convert';
import 'dart:developer';


import 'package:api_fetch/models/items.dart';
import 'package:api_fetch/models/program.dart';
import 'package:http/http.dart' as http;
class APIhandler {

  static Future<List<dynamic>> getData({required String target}) async {
    String BASE_URL = "632017e19f82827dcf24a655.mockapi.io";
    try {
      var uri = Uri.https(BASE_URL, "api/$target");
      var response = await http.get(uri);
      Map<String,dynamic> map=json.decode(response.body);
      List <dynamic> data=map["items"];

      List templist=[];
      if (response.statusCode != 200) {
        throw map["message"];
      }
      for (var v in data) {
        templist.add(v);
        print(v);
      }
      return templist;
    }
    catch (error) {
      log("An error occured $error");
      throw error.toString();
    }
  }
  static Future<List<programsModel>> getAllPrograms ()async{
    //https://632017e19f82827dcf24a655.mockapi.io/api/programs
    List temp=await getData(target: "programs");
    print(temp);
    return programsModel.programsFromSnapshot(temp);
  }
  static Future<List<lessonsModel>> getAllLessons ()async{
    //https://632017e19f82827dcf24a655.mockapi.io/api/programs
    List temp=await getData(target: "lessons");
    return lessonsModel.lessonsFromSnapshot(temp);
  }
}