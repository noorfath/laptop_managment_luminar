import 'package:flutter/material.dart';
import 'login/loginadmin.dart';
import 'package:laptop_managment_luminar/pages/login/login.dart';
import 'package:laptop_managment_luminar/pages/login/system%20login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SelectLogin(),
    );
  }
}

class SelectLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerButton(
              color: Colors.black45,
              text: 'ADMIN',
              icon: Icons.admin_panel_settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLogin()),
                );
              },
            ),
            TextIcon(text: "Students not allowed", icon: Icons.warning),

            Padding(padding: EdgeInsets.all(20)),
            SizedBox(height: 20),
            ContainerButton(
              color: Colors.black45,
              text: 'USER',
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                );
              },
            ),
            TextIcon(text: "Students Loginpage", icon: Icons.warning),
            Padding(padding: EdgeInsets.all(20)),
            SizedBox(height: 20),
            ContainerButton(
              color: Colors.black45,
              text: 'SYSTEM',
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SystemLogin()),
                );
              },
            ),
            TextIcon(text: "For system Registration", icon: Icons.warning),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  ContainerButton({
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 100,
        color: color,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class TextIcon extends StatelessWidget {
  final String text;
  final IconData icon;


  TextIcon({

    required this.text,
    required this.icon,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.red,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
    );
  }
}