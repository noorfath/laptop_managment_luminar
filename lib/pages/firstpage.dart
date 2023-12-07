import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/selectlogin.dart';


void main() {
  runApp(MaterialApp(home: FirstPage(),));
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TAKEIT",
              style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
              ),
            ),
            SizedBox(height: 20),
            Text(
              "its all yours",
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLogin()));
                // Add your button action here
              },
              style: ElevatedButton.styleFrom(primary: Color(0xff434b4b),
                  side:BorderSide(width: 2,color: Colors.white70) ),
              child: Text("Login",style: TextStyle(color: Colors.orange,
                  fontSize: 25,fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}