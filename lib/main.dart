
import 'package:api_fetch/screens/page_selection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "page",
    routes: {
     "page":(context)=>Screen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}