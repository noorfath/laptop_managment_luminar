import 'package:flutter/material.dart';
import 'acer.dart';
import 'asus.dart';
import 'dell.dart';
import 'hp.dart';


class Homescreen extends StatelessWidget {

  var height,width;

  List imgData =[
    "assets/icons/asus_laptop.jpeg",
    "assets/icons/acer_laptop.jpg",
    "assets/icons/dell_laptop.jpeg",
    "assets/icons/hp-laptop.jpg",
  ];
  List Titles =[
    "ASUS",
    "ACER",
    "DELL",
    "HP"

  ];
  @override
  Widget build(BuildContext context) {
    height= MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;

    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          color: Colors.deepPurpleAccent,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
                height: height * 0.10,
                width: width,
                child: const Column(children: [

//                   Padding(
//                     padding:  EdgeInsets.only(top: 35,
//                     left: 15,
//                     right: 15,),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
// //                       InkWell(
// //                         onTap: (){
// // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DrawerEx()));
// //                         },
// //                         child: Icon(
// //                           Icons.sort,
// //                           color: Colors.white,
// //                           size: 40,
// //                         ),
// //                       ),
// //                       Container(
// //                         height: 40,
// //                         width: 40,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(15),
// //                           color: Colors.white,
// //                           image: DecorationImage(
// //                             image:AssetImage(
// //                                 "assets/icons/Woman.png")
// //                           )
// //                         ),
// //
// //                       )
//                     ],),
//                   ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: 15,
                      right: 15,),
                    child: Column(
                      children: [
                        Text("Luminar Technolab",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          )
                          ,)],
                    ),
                  )
                ],),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the corresponding brand page when an image is tapped
                          switch (index) {
                            case 0:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => asusform(),
                                ),
                              );
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => acerform(),
                                ),
                              );
                              break;
                            case 2:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => dellform(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HpForm(),
                                ),
                              );
                              break;
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 100,
                              ),
                              Text(
                                Titles[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

        ),

      ),

    );
  }
}