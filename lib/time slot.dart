// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:laptop_managment_luminar/pages/duhome.dart';
//
//
// class TimeSlotSelectionPage1 extends StatefulWidget {
//   final Laptop selectedLaptop; // Add selectedLaptop property
//
//   TimeSlotSelectionPage1({required this.selectedLaptop});
//
//   @override
//   _TimeSlotSelectionPage1State createState() => _TimeSlotSelectionPage1State();
// }
//
// class _TimeSlotSelectionPage1State extends State<TimeSlotSelectionPage1> {
//   int index = 0;
//
//   // ... (unchanged code)
//   List<String> timeSlots = generateTimeSlots();
//   Map<String, bool> timeSlotStatus = {};
//
//   static List<String> generateTimeSlots() {
//     List<String> slots = [];
//     for (int hour = 8; hour < 18; hour++) {
//       for (int minute = 0; minute < 60; minute += 30) {
//         String formattedHour = hour < 10 ? '0$hour' : '$hour';
//         String formattedMinute = minute == 0 ? '00' : '$minute';
//         slots.add('$formattedHour:$formattedMinute');
//       }
//     }
//     return slots;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize all time slots as "Not Taken"
//     timeSlotStatus = Map.fromIterable(timeSlots, key: (slot) => slot, value: (_) => false);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Time Slot Selection'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ListTile(
//                     title: Text(widget.selectedLaptop.name), // Use selectedLaptop
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Specs: ${widget.selectedLaptop.specs}'), // Use selectedLaptop
//                         Text('Availability: ${widget.selectedLaptop.isAvailable ? 'Available' : 'Not Available'}'),
//                         // ... (unchanged code)
//                         Column(
//                           children: timeSlots.map((time) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(time),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         // Toggle the status of the selected time slot
//                                         timeSlotStatus[time] = !timeSlotStatus[time]!;
//                                       });
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       primary: timeSlotStatus[time]! ? Colors.red : Colors
//                                           .green,
//                                     ),
//                                     child: Text(timeSlotStatus[time]! ? 'Taken' : 'Take'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     )
//
//
//                 )]
//           ),
//
//         ),
//       ),
//
//     );
//   }
// }