import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/homepage.dart';
import 'package:laptop_managment_luminar/pages/navbar%20pages/profile.dart';
import 'navbar pages/chat.dart';


void main(){
  runApp(MaterialApp(
    home: BottomNavBar(),
    debugShowCheckedModeBanner: false,
  ));
}
class BottomNavBar  extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index=0;
  var Screen=[
    HomePage1(),
    Chat(),
    Profile_page(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,

      bottomNavigationBar:BottomNavigationBar(
          onTap: (tapindex){
            setState(() {
              index=tapindex;
            });
          },
          backgroundColor: Colors.white70,
          currentIndex: index,
          selectedItemColor: Colors.white70,
          // type: BottomNavigationBarType.fixed
          type: BottomNavigationBarType.shifting ,//slideshow
          items: const[
            BottomNavigationBarItem(
                backgroundColor: Colors.white10,//applicable for bottom navigation bar type shifting
                icon: Icon(Icons.home,color: Colors.white70,),
                label:"Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white10,
                icon: Icon(Icons.chat,color: Colors.white70,),
                label:"Chats"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white10,
                icon: Icon(Icons.person_3_rounded,color: Colors.white70,),
                label:"Profile")
          ] ) ,
      body: Screen[index],
    );
  }
}