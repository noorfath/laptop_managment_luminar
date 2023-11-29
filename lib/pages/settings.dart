import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;
  bool _pic=false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _saveSettings() async {
    await _prefs.setBool('darkMode', _darkMode);
  }

  // Function to show the notification settings popup
  void _showNotificationSettingsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notification Settings"),
          content: Text("You can change sound and vibration settings of the "
              "notification"),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                },
                child: Text("Go To Settings"),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Notification Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    _showNotificationSettingsPopup(context);
                  },
                ),
              ],
            ),
            Text(
              'Theme Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            SwitchListTile(
              title: Text("Enable Picture-in-Picture"),
              value: _pic,
              onChanged: (value) {
                setState(() {
                  _pic = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
                children: [
                  CustomCard(
                    icon: Icons.share,
                    text: 'Share', onTap: () {  },

                  ),


                  CustomCard(
                    icon: Icons.star,
                    text: 'Rate us', onTap: () {  },

                  ),
                ]
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor:Colors.deepPurpleAccent ,),
                onPressed: () async {
                  await _saveSettings();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Settings saved successfully')),
                  );
                },
                child: Text('Save Settings'),
              ),
            ),
            SizedBox(height: 30,),

            Center(
              child: Row(
                  children:[ TextButton(
                    onPressed: () {
                      // Navigate to the screen with terms and conditions
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                      );
                    },
                    child: Text(' Terms & Conditions'),
                  ),
                    Text("of using the product")
                  ]
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:Colors.transparent,side:
                  BorderSide( ),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () {}, child:  Text('Privacy Policy'),
                )

            ),

          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final double cardWidth;
  final double cardHeight;
  final double borderRadius;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.icon,
    required this.text,
    this.cardWidth = 180.0,
    this.cardHeight = 100.0,
    this.borderRadius = 15.0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ListTile(
          leading: Icon(icon),onTap: (){},
          title: Text(text),
        ),
      ),

    );
  }
}


class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurpleAccent,
          title: Text('Terms and Conditions'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLEASE READ THIS DOCUMENT CAREFULLY',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('''We grant you a limited, non-exclusive license to access and use our platform for your own personal and commercial purposes. This license is only for your use and may not be assigned or sublicensed to anyone else, without the platform’s express written consent. Except as expressly permitted by the platform in writing, you will not try to reproduce the platform (legally that’s known as engaging in activity that would reproduce, redistribute, sell, create derivative works from, decompile, reverse engineer, or disassemble the Platform). You also agree that in exchange for this license You will not engage in any activity that would interfere with or damage or harm the Platform. All rights not expressly granted by the platform are reserved.
               '''),
                  SizedBox(height: 16),
                  Text(
                    'LICENCE TO TUTORS & STUDENTS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('''This document sets out the terms for use of the platform.It governs both our Course & Content creators (“Tutors”) and our end-users (“Students”)., When we refer to “You”, we mean both our Tutors and Students or just our Tutors or our Students (don’t worry, we’ll make it clear who we’re talking to, but when in  doubt, we’re talking to you). We are committed transparency, which includes providing a Terms of Use thatis understandable and written in plain language. Because  this document represents our agreement with you about your use of our platform ,please take the time to read this document.
               '''),

                  SizedBox(height: 16),

                  Text(
                    "Error and Corrections",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('''1.The platform does not guarantee that the Platform or any services offered through the Platform will be error-free or otherwise reliable, nor does the platform guarantee that defects will be corrected or that any offerings through the Platform will always be accessible. The platform may make improvements and/or changes to the Platform and their features and functionality at any time, and will use commercially reasonable efforts to avoid disrupting peak hours, though some downtime may occur. Errors in Content are the responsibility of the Creator who owns the Content.
2.We reserve the right to amend the Platform, and any service or material we provide on the Platform, in our sole discretion without notice. We will not be liable if for any reason all or any part of the Platform is unavailable at any time or for any period. From time to time, we may restrict access to some or all of the Platform to Tutors and Students.
               '''),


                ],
              ),
            ),

          ),
        )
    );
  }
}