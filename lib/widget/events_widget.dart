import 'package:api_fetch/models/items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    final lessonsModel eventsmodelprovider = Provider.of<lessonsModel>(context);
    // DateTime tempDate=new DateFormat().add_yMMMEd().parse(lessonmodelprovider.createdAt.toString());
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
        child: Align(alignment:Alignment.centerLeft,child: Text(eventsmodelprovider.category.toString(),style: TextStyle(color: Colors.blue.shade600,fontSize: 14,fontWeight: FontWeight.bold),)),
        ),
        SizedBox(height: 5),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: Align(alignment:Alignment.centerLeft,child: Container(child: Text(eventsmodelprovider.name.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),))),
        ),
        SizedBox(height: 5),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(eventsmodelprovider.createdAt.toString().substring(0,10),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey)),
        Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
        color: Colors.blueAccent.shade700
        )
        ),
        child: Center(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
        child: Text('Book',style: TextStyle(fontSize: 15,color: Colors.blueAccent.shade700),),
        ),),
        )
        ],
        )
        ),
        ],
        ),
    )
    );
  }
}
