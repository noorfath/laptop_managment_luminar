import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laptop_managment_luminar/pages/acer.dart';
import 'package:laptop_managment_luminar/pages/asus.dart';
import 'package:laptop_managment_luminar/pages/dell.dart';
import 'package:laptop_managment_luminar/pages/hp.dart';


void main(){
  runApp(MaterialApp(home: Homescreen(),));
}
class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var height, width;
  List imgData = [
    "assets/icons/asus_laptop.jpeg",
    "assets/icons/acer_laptop.jpg",
    "assets/icons/dell_laptop.jpeg",
    "assets/icons/hp-laptop.jpg",
  ];
  List Titles = ["ASUS", "ACER", "DELL", "HP"];
  List<int> stockAvailability = [0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    fetchStockAvailability();
  }

  Future<void> fetchStockAvailability() async {
    try {
      for (int i = 0; i < Titles.length; i++) {
        final response = await http.get(
          Uri.parse('YOUR_STOCK_API_ENDPOINT/${Titles[i]}'),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            stockAvailability[i] = data['stockAvailability'];
          });
        } else {
          // Handle error
          print('Failed to fetch stock availability for ${Titles[i]}. '
              'Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle network or other errors
      print('Error fetching stock availability: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurpleAccent,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
                height: height * .10,
                width: width,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Luminar Technolab",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the corresponding brand page when an image is tapped
                          switch (index) {
                            case 0:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => asusform(),
                                ),
                              );
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => acerform(),
                                ),
                              );
                              break;
                            case 2:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => dellform(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HpForm(),
                                ),
                              );
                              break;
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 80,
                              ),
                              Text(
                                Titles[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Stock Available: ${stockAvailability[index]} ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
