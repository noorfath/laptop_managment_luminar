import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AvailableLaptopsPage extends StatelessWidget {
  final List<Laptop> laptops;
  final DateTime issueTime;
  final DateTime returnTime;

  AvailableLaptopsPage({
    required this.laptops,
    required this.issueTime,
    required this.returnTime,
  });

  @override
  Widget build(BuildContext context) {
    List<Laptop> availableLaptops = laptops
        .where((laptop) =>
    laptop.isAvailable &&
        isLaptopInTimeSlot(laptop, issueTime, returnTime))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Available Laptops'),
      ),
      body: Column(
        children: availableLaptops.map((laptop) => Text(laptop.name)).toList(),
      ),
    );
  }

  bool isLaptopInTimeSlot(Laptop laptop, DateTime issueTime, DateTime returnTime) {
    return laptop.isAvailable &&
        (issueTime.isBefore(returnTime) &&
            returnTime.isBefore(issueTime.add(Duration(hours: 2))));
  }
}

class Laptop {
  final String name;
  bool isAvailable;

  Laptop({required this.name, required this.isAvailable});
}

class TimeForm extends StatefulWidget {
  @override
  _TimeFormState createState() => _TimeFormState();
}

class _TimeFormState extends State<TimeForm> {

  final _formKey = GlobalKey<FormState>();
  DateTime? issueTime;
  DateTime? returnTime;
  List<Laptop> laptops = [
    Laptop(name: 'Laptop 1', isAvailable: true),
    Laptop(name: 'Laptop 2', isAvailable: false),
    Laptop(name: 'Laptop 3', isAvailable: true),
    Laptop(name: "laptop4", isAvailable: false)
    // Add more laptops as needed
  ];
  List<Laptop> availableLaptops = [
    Laptop(name: 'Laptop 1', isAvailable: true,),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DateTimeField(
                format: DateFormat("yyyy-MM-dd HH:mm"),
                onShowPicker: (context, currentValue) async {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2101),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      return showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now(),
                        ),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          return DateTimeField.combine(
                              selectedDate, selectedTime);
                        } else {
                          return currentValue;
                        }
                      });
                    } else {
                      return currentValue;
                    }
                  });
                },
                decoration: InputDecoration(labelText: 'Select Issue Time'),
                onChanged: (selectedDateTime) {
                  setState(() {
                    issueTime = selectedDateTime;
                  });
                },
              ),
              SizedBox(height: 20),
              DateTimeField(
                format: DateFormat("yyyy-MM-dd HH:mm"),
                onShowPicker: (context, currentValue) async {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2101),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      return showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now(),
                        ),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          return DateTimeField.combine(
                              selectedDate, selectedTime);
                        } else {
                          return currentValue;
                        }
                      });
                    } else {
                      return currentValue;
                    }
                  });
                },
                decoration: InputDecoration(labelText: 'Select Return Time'),
                onChanged: (selectedDateTime) {
                  setState(() {
                    returnTime = selectedDateTime;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Clear the previous available laptops
                    availableLaptops.clear();

                    // Check laptop availability in the given time slot
                    availableLaptops = laptops
                        .where((laptop) =>
                    laptop.isAvailable &&
                        isLaptopInTimeSlot(laptop, issueTime!, returnTime!))
                        .toList();

                    // Show the dialog if laptops are available
                    if (availableLaptops.isEmpty) {
                      _showAvailableLaptopsDialog(context);
                    }
                  }
                },
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Function to check if a laptop is in the selected time slot
  bool isLaptopInTimeSlot(Laptop laptop, DateTime issueTime,
      DateTime returnTime) {
    return laptop.isAvailable &&
        (issueTime.isBefore(returnTime) &&
            returnTime.isBefore(issueTime.add(Duration(hours: 2))));
  }

  // Function to show available laptops in a dialog
//   void _showAvailableLaptopsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Available Laptops'),
//           content: Column(
//             children: availableLaptops
//                 .map((laptop) => Text(laptop.name))
//                 .toList(),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
  void _showAvailableLaptopsDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvailableLaptopsPage(
          laptops: laptops,
          issueTime: issueTime!,
          returnTime: returnTime!,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TimeForm(),
  ));
}