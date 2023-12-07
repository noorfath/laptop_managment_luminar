import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/drawer.dart';



class User {
  final String username;
  final String number;
  final String batch;
  final String course;
  final String password;

  User({
    required this.username,
    required this.number,
    required this.batch,
    required this.course,
    required this.password,
  });
}

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: numberController,
                decoration: InputDecoration(labelText: 'Number'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: batchController,
                decoration: InputDecoration(labelText: 'Batch'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: courseController,
                decoration: InputDecoration(labelText: 'Course'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check login credentials (You can replace this with your logic)
                  if (validateLogin()) {
                    // Navigate to DashboardPage on successful login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DrawerEx(),
                      ),
                    );
                  } else {
                    // Show an error message or handle unsuccessful login
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid Login'),
                          content: Text('Please check your credentials and try again.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateLogin() {
    // Replace this with your logic to validate the login credentials
    // For simplicity, we are checking if the password is 'password'
    return passwordController.text == 'password';
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
