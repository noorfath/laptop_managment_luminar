import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/duhome.dart';
import 'package:laptop_managment_luminar/pages/timeform.dart';
import 'package:laptop_managment_luminar/time%20slot.dart';


void main(){
  runApp(MaterialApp(home: HomePage1(),));
}

class HomePage1 extends StatelessWidget {
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
      backgroundColor: Colors.black54,
      body: ListView.builder(
        itemCount: laptops.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(laptops[index].name,style: TextStyle(color: Colors.white),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Specs: ${laptops[index].specs}',style: TextStyle(color: Colors.white70),),
                Text('Availability: ${laptops[index].isAvailable ? 'Available' : 'Not Available'}',style: TextStyle(color: Colors.white70),),
                Row(
                  children: [
                    Text('Select Software:',style: TextStyle(color: Colors.white70),),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: null,
                      items: softwareList.map((Software software) {
                        return DropdownMenuItem<String>(
                          value: software.name,
                          child: Text(software.name,style: TextStyle(color: Colors.white70),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle software selection
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey.shade800),
                  onPressed: () {
                    // Handle laptop selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeForm(
                         // Pass selected laptop
                        ),
                      ),
                    );
                  },
                  child: Text(laptops[index].isSelected ? 'Deselect' : 'Select',style: TextStyle(color: Colors.white),),
                ),
                Row(
                  children: [
                    Text('Rating:',style: TextStyle(color: Colors.white70),),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {
                        // Handle rating
                      },
                    ),
                    Text('${laptops[index].rating}',style: TextStyle(color: Colors.white70),),
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