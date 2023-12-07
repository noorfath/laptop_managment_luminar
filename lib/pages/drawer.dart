
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptop_managment_luminar/pages/bottom%20nav.dart';
import 'package:laptop_managment_luminar/pages/settings.dart';

import '../utilz/colors.dart';
import 'about.dart';
import 'login/login.dart';


class DrawerEx extends StatefulWidget {
  @override
  State<DrawerEx> createState() => _DrawerExState();
}



class _DrawerExState extends State<DrawerEx> {

  late ImagePicker _imagePicker;
  String? _pickedImagePath;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luminar Technolab',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black45,
        elevation: 10,
      ),

      drawer: Drawer(
        backgroundColor: kGreyColor,
        child: ListView(
          children: [

            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: klblueColor,

              ),
              accountName: const Text(
                "My Name",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              accountEmail: const Text(
                "myname@gmail.com", style: TextStyle(color: Colors.white70),),
              currentAccountPicture:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 35,
                        backgroundImage: _pickedImagePath != null
                            ? FileImage(File(_pickedImagePath!))
                            : null,
                        child: IconButton(
                          onPressed: () {
                            _openCamera();
                          },
                          icon: Icon(Icons.add_a_photo,color: Colors.white,),
                        ),

                      ),
                      // Positioned(
                      //
                      //   bottom: -10,
                      //   left: 80,
                      // ),
                    ],
                  ),


                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home, color: Colors.white70,),
              title: Text(
                "Home", style: TextStyle(fontSize: 18, color: Colors.white70),),
              onTap: () => Navigator.of(context).pop(),
            ),

            ListTile(
                leading: Icon(Icons.book_online, color: Colors.white70,),
                title: Text("How to use",
                  style: TextStyle(fontSize: 18, color: Colors.white70),),
                onTap: () =>
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutApp()))),


            ListTile(
              leading: Icon(Icons.settings, color: Colors.white70,),
              title: Text("Settings",
                style: TextStyle(fontSize: 18, color: Colors.white70),),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute
                    (builder: (context) => SettingsPage())),
            ),

            ListTile(
              leading: Icon(Icons.logout, color: Colors.white70,),
              title: Text("Signout",
                style: TextStyle(fontSize: 18, color: Colors.white70),),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute
                    (builder: (context) => MyLogin())),
            ),


          ],
        ),
      ),
      body: BottomNavBar(),
      // ),
    );
  }

  void _openCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    // Handle the captured image as needed
    if (image != null) {
      // Perform operations with the image
      print("Image path: ${image.path}");
      setState(() {
        _pickedImagePath = image.path;
      });
    }
  }
}

