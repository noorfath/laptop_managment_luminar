// laptop_page.dart

import 'package:flutter/material.dart';

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

class LaptopPage extends StatelessWidget {
  final Laptop newLaptop;

  LaptopPage({required this.newLaptop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Newly Registered Laptops:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Name: ${newLaptop.name}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Specs: ${newLaptop.specs}'),
                  Text('Availability: ${newLaptop.isAvailable ? 'Available' : 'Not Available'}'),
                  Text('Rating: ${newLaptop.rating}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
