import 'package:api_fetch/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    final lessonsModel lessonsmodelprovider = Provider.of<lessonsModel>(context);
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
            Image.asset("assets/exer.png",fit:BoxFit.fitWidth),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Align(alignment:Alignment.centerLeft,child: Text(lessonsmodelprovider.category.toString(),style: TextStyle(color: Colors.blue.shade600,fontSize: 14,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Align(alignment:Alignment.centerLeft,child: Container(child: Text(lessonsmodelprovider.name.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),))),
            ),
            SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${lessonsmodelprovider.duration.toString()} min",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                    Icon(lessonsmodelprovider.locked==false?Icons.lock_open_rounded:Icons.lock_outlined,color: Colors.grey,)
                  ],
                )
            ),
          ],
        ),
      ),
    );;
  }
}
