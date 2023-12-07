import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/laptop.dart';
 void main(){
   runApp(MaterialApp(home: LaptopFormPage(),));
 }

class Laptop {
  final String name;
  final String specs;

  Laptop({
    required this.name,
    required this.specs,
  });
}

class LaptopFormPage extends StatefulWidget {
  @override
  _LaptopFormPageState createState() => _LaptopFormPageState();
}

class _LaptopFormPageState extends State<LaptopFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController specsController = TextEditingController();

  void saveLaptopDetails() {
    // Create a Laptop object with the entered details
    Laptop laptop = Laptop(
      name: nameController.text,
      specs: specsController.text,
    );

    // Navigate to the LaptopPage with the entered laptop details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LaptopPage(laptop: laptop),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Laptop Name'),
            ),
            TextField(
              controller: specsController,
              decoration: InputDecoration(labelText: 'Laptop Specs'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveLaptopDetails,
              child: Text('Save Laptop Details'),
            ),
          ],
        ),
      ),
    );
  }
}
