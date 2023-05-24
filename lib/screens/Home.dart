
import 'package:api_fetch/api_handler/api.dart';
import 'package:api_fetch/models/items.dart';
import 'package:api_fetch/models/program.dart';
import 'package:api_fetch/widget/events_widget.dart';
import 'package:api_fetch/widget/lesson_widget.dart';
import 'package:api_fetch/widget/program_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<programsModel> programsList=[];
  Future<void> getPrograms() async{
    programsList=await APIhandler.getAllPrograms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue.shade50,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(alignment:Alignment.centerLeft,child: Text('Hello,Priya!',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold))),
                  SizedBox(height: 10,),
                  Align(alignment:Alignment.centerLeft,child: Text('What do you wanna learn today?',style: TextStyle(color: Colors.black,fontSize: 15),textAlign: TextAlign.start)),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.blueAccent.shade700,
                            )
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/books.png",width: 20,height: 20,color: Colors.blueAccent.shade700),
                            SizedBox(width: 10,),
                            Text('Programs',style: TextStyle(color: Colors.blueAccent.shade700,fontSize: 16,fontWeight: FontWeight.bold),)
                          ],
                        ),),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.blueAccent.shade700,
                            )
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/ques.png",width: 20,height: 20,color: Colors.blueAccent.shade700),
                            SizedBox(width: 10,),
                            Text('Get Help',style: TextStyle(color: Colors.blueAccent.shade700,fontSize: 16,fontWeight: FontWeight.bold),)
                          ],
                        )),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.blueAccent.shade700,
                            )
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/opb.png",width: 20,height: 20,color: Colors.blueAccent.shade700),
                            SizedBox(width: 10,),
                            Text('Learn',style: TextStyle(color: Colors.blueAccent.shade700,fontSize: 16,fontWeight: FontWeight.bold),)
                          ],
                        ),),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.blueAccent.shade700,
                            )
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/stats.png",width: 20,height: 20,color: Colors.blueAccent.shade700),
                            SizedBox(width: 10,),
                            Text('DD Tracker',style: TextStyle(color: Colors.blueAccent.shade700,fontSize: 16,fontWeight: FontWeight.bold),)
                          ],
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Programs for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  InkWell(onTap:(){},child: Text('View all ->',style: TextStyle(fontSize: 15,color: Colors.grey)))
                ],
              ),
            ),
            FutureBuilder<List<programsModel>>(
              future: APIhandler.getAllPrograms(),
              builder: ((context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  Center(child: Text("An error occured ${snapshot.error}"),);
                }
                else if(snapshot.data == null){
                  Center(
                      child:Text("No products has been added yet")
                  );
                }
                return Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: Programs(),);
                  }),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Events and Experiences',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Schyler')),
                  InkWell(onTap:(){},child: Text('View all->',style: TextStyle(fontSize: 15,color: Colors.grey)))
                ],
              ),
            ),
            FutureBuilder<List<lessonsModel>>(
              future: APIhandler.getAllLessons(),
              builder: ((context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  Center(child: Text("An error occured ${snapshot.error}"),);
                }
                else if(snapshot.data == null){
                  Center(
                      child:Text("No products has been added yet")
                  );
                }
                return Container(
                  height: 320,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return ChangeNotifierProvider.value(
                          value: snapshot.data![index],
                          child:Events(),);
                      }),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lessons for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Schyler')),
                  InkWell(onTap:(){},child: Text('View all->',style: TextStyle(fontSize: 15,color: Colors.grey)))
                ],
              ),
            ),
            FutureBuilder<List<lessonsModel>>(
              future: APIhandler.getAllLessons(),
              builder: ((context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  Center(child: Text("An error occured ${snapshot.error}"),);
                }
                else if(snapshot.data == null){
                  Center(
                      child:Text("No products has been added yet")
                  );
                }
                return Container(
                  height: 320,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return ChangeNotifierProvider.value(
                          value: snapshot.data![index],
                          child:Lesson(),);
                      }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
