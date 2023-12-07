// system_page.dart

import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/trials/lapp.dart';

class SystemRegistrationPage extends StatefulWidget {
  @override
  _SystemRegistrationPageState createState() => _SystemRegistrationPageState();
}

class _SystemRegistrationPageState extends State<SystemRegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController specsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Laptop Name'),
            ),
            TextField(
              controller: specsController,
              decoration: InputDecoration(labelText: 'Laptop Specifications'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a new Laptop object with the entered details
                Laptop newLaptop = Laptop(
                  name: nameController.text,
                  specs: specsController.text,
                  isAvailable: true, // You can customize this based on your logic
                  isSelected: false,
                  rating: 0,
                );

                // Navigate to the Laptop Page and pass the new laptop details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LaptopPage(newLaptop: newLaptop),
                  ),
                );
              },
              child: Text('Register Laptop'),
            ),
          ],
        ),
      ),
    );
  }
}
