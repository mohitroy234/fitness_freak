
import 'package:api_fetch/models/program.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Programs extends StatefulWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    final programsModel programsmodelprovider= Provider.of<programsModel>(context);
     return GestureDetector(
       onTap: (){},
       child: Container(
         margin: EdgeInsets.all(10.0),
         width: 280,
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.0),
             boxShadow: [
               BoxShadow(
                   color: Colors.grey.shade400,
                   spreadRadius: 2.0,
                   blurRadius: 3.0
               )
             ]
         ),
         child: Column(
           children: [
             Image.asset("assets/img1.png",fit:BoxFit.fitWidth),
             SizedBox(height: 5),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
               child: Align(alignment:Alignment.centerLeft,child: Text(programsmodelprovider.category.toString(),style: TextStyle(color: Colors.blue.shade600,fontSize: 14,fontWeight: FontWeight.bold),)),
             ),
             SizedBox(height: 5),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
               child: Align(alignment:Alignment.centerLeft,child: Container(child: Text(programsmodelprovider.name.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),))),
             ),
             SizedBox(height: 5),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
               child: Align(alignment:Alignment.centerLeft,child: Text("${programsmodelprovider.lesson.toString()} lessons",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),)),
             ),
           ],
         ),
       ),
     );
  }
}
