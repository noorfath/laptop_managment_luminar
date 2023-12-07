import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminLoginPage(),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to Admin Home Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/adminbg.jpg'),  // Replace with your background image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white70),
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.person,color: Colors.white70,),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Colors.white70),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.lock,color: Colors.white70,),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Replace the condition with your authentication logic
                  if (usernameController.text == 'admin' && passwordController.text == 'password') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminHomePage(),
                      ),
                    );
                  } else {
                    // Show an error message for invalid credentials
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid username or password'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Adminpage()));
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
}
