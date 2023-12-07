import 'package:flutter/material.dart';


class Complaint {
  final String username;
  final String complaint;
  bool isSolved;

  Complaint({
    required this.username,
    required this.complaint,
    this.isSolved = false, // Default value is false
  });
}

class Adminpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminPage(),
    );
  }
}

class UserComplaintPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Complaints'),
      ),
      body: Padding(
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
              controller: complaintController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Complaint'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the complaint to the admin (you can replace this logic)
                Complaint complaint = Complaint(
                  username: usernameController.text,
                  complaint: complaintController.text,
                );

                // Navigate back to the AdminPage and pass the complaint
                Navigator.pop(context, complaint);
              },
              child: Text('Submit Complaint'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Complaint> complaints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Username: ${complaints[index].username}'),
            subtitle: Text('Complaint: ${complaints[index].complaint}'),
            trailing: ElevatedButton(
              onPressed: () async {
                // Take action on the complaint
                bool isSolved = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Mark as Solved?'),
                      content: Text('Have you solved the problem?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Return true if the complaint is solved
                            Navigator.pop(context, true);
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Return false if the complaint is not solved
                            Navigator.pop(context, false);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );

                // Update the state based on the user's choice
                setState(() {
                  complaints[index].isSolved = isSolved;
                });
              },
              child: Text(complaints[index].isSolved ? 'Solved' : 'Unsolved'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to UserComplaintPage to receive complaints
          Complaint? complaint = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserComplaintPage(),
            ),
          );

          // If a complaint is received, add it to the list
          if (complaint != null) {
            setState(() {
              complaints.add(complaint);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
