import 'dart:io';

import 'package:api_fetch/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}
class _ScreenState extends State<Screen> {
  File? image;
  int currentTab=0;
  final List<Widget> screens=[
    Home(),
  ];
  final PageStorageBucket bucket =PageStorageBucket();
  Widget currentScreen=Home();
  void selectImage() async{
    image= await pickImage(context);
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.short_text,size: 35,),color: Colors.grey,) ,
        backgroundColor: Colors.lightBlue.shade50,
        actions: [
          IconButton(onPressed:() {}, icon: Icon(Icons.chat_outlined),color: Colors.grey,),
          IconButton(onPressed:() {}, icon: Icon(Icons.notifications_outlined),color: Colors.grey,)
        ],
      ),
      body:PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        shape:CircularNotchedRectangle(),
        notchMargin: 0,
        child: Container(
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(minWidth:40,onPressed: (){
                setState(() {
                  currentScreen = Home();
                  currentTab=0;
                });
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),child: Center(child: Icon(Icons.home,size: 30,color: currentTab==0?Colors.blueAccent.shade400:Colors.grey.shade600))),
                    SizedBox(height: 10,),
                    Text('Home',style: TextStyle(fontSize: 10,color: currentTab==0?Colors.blueAccent.shade400:Colors.grey))
                  ],
                ),
              ),
              MaterialButton(minWidth:40,onPressed: (){
                setState(() {currentTab=1;
                });
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),child: Center(child:Icon( Icons.menu_book_outlined,size: 30,color: currentTab==1?Colors.blueAccent.shade400:Colors.grey.shade600))),
                    SizedBox(height: 10,),
                    Text('Learn',style: TextStyle(fontSize: 10,color: currentTab==1?Colors.blueAccent.shade400:Colors.grey))
                  ],
                ),
              ),
              MaterialButton(minWidth:40,onPressed: (){
                setState(() {
                  currentTab=2;
                });
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),child: Center(child: Icon(Icons.widgets_outlined,size: 30,color: currentTab==2?Colors.blueAccent.shade400:Colors.grey.shade600))),
                    SizedBox(height: 10,),
                    Text('Hub',style: TextStyle(fontSize: 10,color: currentTab==2?Colors.blueAccent.shade400:Colors.grey))
                  ],
                ),
              ),
              MaterialButton(minWidth:40,onPressed: (){
                setState(() {
                  currentTab=3;
                });
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),child: Center(child: Icon(Icons.chat_bubble_outline,size: 30,color: currentTab==3?Colors.blueAccent.shade400:Colors.grey.shade600))),
                    SizedBox(height: 10,),
                    Text('Chat',style: TextStyle(fontSize: 10,color: currentTab==3?Colors.blueAccent.shade400:Colors.grey))
                  ],
                ),
              ),
              MaterialButton(minWidth:40,onPressed: (){
                setState(() {
                  currentTab=4;
                });
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),child: Center(child: InkWell(onTap:(){selectImage();},child: CircleAvatar(backgroundColor:Colors.blue.shade200,radius:40,child:image==null? CircleAvatar(
                      backgroundColor: Colors.grey.shade600,
                      radius: 25,
                      child:Icon(Icons.account_circle,size: 20,color: Colors.white,) ,
                    ):CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 25,
                    ),)))),
                    SizedBox(height: 10,),
                    Text('Profile',style: TextStyle(fontSize: 10,color: currentTab==4?Colors.blueAccent.shade400:Colors.grey))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future <File?> pickImage(BuildContext context)async{
    File? image;
    try{
      final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage!=null){
        image=File(pickedImage.path);
      }
    }
    catch(e){
      print(e.toString());
    }
    return image;
  }
}
