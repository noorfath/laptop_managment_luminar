import 'package:flutter/material.dart';
import 'laptop.dart';
class Laptop {
  final String name;
  final String specs;

  Laptop({
    required this.name,
    required this.specs,
  });
}

class LaptopPage extends StatelessWidget {
  final Laptop laptop;

  LaptopPage({required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Laptop Details:'),
            Text('Name: ${laptop.name}'),
            Text('Specs: ${laptop.specs}'),
          ],
        ),
      ),
    );
  }
}
