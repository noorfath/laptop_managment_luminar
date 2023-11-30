import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/time%20slot.dart';

void main() {
  runApp(MyApp());
}

class Laptop {
  final String name;
  final String specs;
  bool isAvailable;
  bool isSelected;
  int rating;

  Laptop({
    required this.name,
    required this.specs,
    this.isAvailable = true,
    this.isSelected = false,
    this.rating = 0,
  });
}

class Software {
  final String name;

  Software({
    required this.name,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaptopsPage(),
    );
  }
}

class LaptopsPage extends StatelessWidget {
  List<Laptop> laptops = [
    Laptop(name: 'Laptop A', specs: 'Specs A'),
    Laptop(name: 'Laptop B', specs: 'Specs B', isAvailable: false),
    Laptop(name: 'Laptop C', specs: 'Specs C'),
  ];

  List<Software> softwareList = [
    Software(name: 'Software 1'),
    Software(name: 'Software 2'),
    Software(name: 'Software 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptops'),
      ),
      body: ListView.builder(
        itemCount: laptops.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(laptops[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Specs: ${laptops[index].specs}'),
                Text('Availability: ${laptops[index].isAvailable ? 'Available' : 'Not Available'}'),
                Row(
                  children: [
                    Text('Select Software:'),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: null,
                      items: softwareList.map((Software software) {
                        return DropdownMenuItem<String>(
                          value: software.name,
                          child: Text(software.name),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle software selection
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle laptop selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeSlotSelectionPage(),
                      ),
                    );
                  },
                  child: Text(laptops[index].isSelected ? 'Deselect' : 'Select'),
                ),
                Row(
                  children: [
                    Text('Rating:'),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {
                        // Handle rating
                      },
                    ),
                    Text('${laptops[index].rating}'),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        // Handle favorite
                      },
                    ),
                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

// Rest of the code remains the same...
