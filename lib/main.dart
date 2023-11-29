import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/login.dart';
import 'package:laptop_managment_luminar/pages/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}