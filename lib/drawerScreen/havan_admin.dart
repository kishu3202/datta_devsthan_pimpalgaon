// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
//
// class HavanBookingAdminScreen extends StatefulWidget {
//   const HavanBookingAdminScreen({super.key});
//
//   @override
//   State<HavanBookingAdminScreen> createState() =>
//       _HavanBookingAdminScreenState();
// }
//
// class _HavanBookingAdminScreenState extends State<HavanBookingAdminScreen> {
//   final db = FirebaseFirestore.instance;
//   final usersQuery = FirebaseFirestore.instance
//       .collectionGroup("appointments")
//       //.orderBy("bookingDate", descending: true);
//        .orderBy("schedule", descending: true)
//        .orderBy("day", descending: true)
//        .orderBy("slot", descending: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('हवन (Admin)',
//             style: TextStyle(color: Colors.white, fontSize: 18)),
//         centerTitle: true,
//       ),
//       body: FirestoreListView<Map<String, dynamic>>(
//         emptyBuilder: (context) => const Text('You have no appointments'),
//         query: usersQuery,
//         itemBuilder: (context, snapshot) {
//           Map<String, dynamic> appointment = snapshot.data();
//           final appointmentId = snapshot.id;
//           final String name = appointment['name'];
//           final int year = appointment['schedule'];
//           final int day = appointment['day'];
//           final int slot = appointment['slot'];
//           final String telephone = appointment['telephone'];
//           final String address = appointment['address'];
//           final String status = appointment['status'] ?? 'Cancel';
//           final String userId = appointment['userId'];
//
//           // to calculte date from day of year and year
//           // ref: https://stackoverflow.com/questions/60282195/how-to-get-date-given-only-the-day-of-year-number-in-flutter
//           // final dayOfYear = day;
//           // final millisInADay = const Duration(days: 1).inMilliseconds; // 86400000
//           // final millisDayOfYear = dayOfYear * millisInADay;
//           // final millisecondsSinceEpoch = DateTime(year).millisecondsSinceEpoch;
//
//           //var date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch + millisDayOfYear);
//           var date = DateTime(year, 1, 1).add(Duration(days: day - 1));
//           return ListTile(
//             subtitle: Text(
//                 'Date: ${DateFormat('dd/MM/yyyy').format(date)} ($day) slot: ${slot<12?"$slot am":slot==12?"$slot noon":"${slot-12} pm"} contact: $telephone \n$address'),
//             title: Text(name),
//             trailing: TextButton(
//               onPressed: () {
//                 if (status == "Cancelled") {
//                   return;
//                 }
//                 else if (status=="Booked"){
//                   final appointmentRef =
//                   db.collection("users/$userId/appointments").doc(appointmentId);
//                   appointmentRef.update({
//                     "status": "Cancelled",
//                   });
//
//                   final bookedscheduleRef =
//                   db.collection("schedules_booked").doc('$year');
//                   bookedscheduleRef.update({
//                     "$day": FieldValue.arrayRemove([slot]),
//                   });
//
//                   final scheduleRef =
//                   db.collection("schedules").doc('$year');
//                   scheduleRef.update({
//                     "$day": FieldValue.arrayUnion([slot]),
//                   });
//                 }
//
//               },
//               child: Text(status=="Booked"?"Cancel":"Cancelled"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HavanBookingAdminScreen extends StatefulWidget {
  const HavanBookingAdminScreen({super.key});

  @override
  State<HavanBookingAdminScreen> createState() =>
      _HavanBookingAdminScreenState();
}

class _HavanBookingAdminScreenState extends State<HavanBookingAdminScreen> {
  final db = FirebaseFirestore.instance;
  final usersQuery = FirebaseFirestore.instance
      .collectionGroup("appointments")
      .orderBy("schedule", descending: true)
      .orderBy("day", descending: true)
      .orderBy("slot", descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('हवन (Admin)',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        emptyBuilder: (context) => const Text('You have no appointments'),
        query: usersQuery,
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> appointment = snapshot.data();
          final appointmentId = snapshot.id;
          final String name = appointment['name'];
          final int year = appointment['schedule'];
          final int day = appointment['day'];
          final int slot = appointment['slot'];
          final String telephone = appointment['telephone'];
          final String address = appointment['address'];
          final String status = appointment['status'] ?? 'Cancel';
          final String userId = appointment['userId'];

          // Calculate the date from the day of the year and year
          var date = DateTime(year, 1, 1).add(Duration(days: day - 1));

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Date: ${DateFormat('dd/MM/yyyy').format(date)} ($day)\n'
                        'Slot: ${slot < 12 ? "$slot AM" : slot == 12 ? "$slot Noon" : "${slot - 12} PM"}\n'
                        'Contact: $telephone\n'
                        'Address: $address',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
                    children: [
                      // Cancel/Cancelled Button
                      Container(
                        decoration: BoxDecoration(
                          gradient: status == "Cancelled"
                              ? LinearGradient(
                            colors: [
                              Colors.grey.shade400, // Light grey
                              Colors.grey.shade600, // Darker grey
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                              : LinearGradient(
                            colors: [
                              Colors.redAccent,
                              Colors.red.shade700, // A darker shade of red
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (status == "Cancelled") return;

                            final appointmentRef =
                            db.collection("users/$userId/appointments").doc(appointmentId);
                            appointmentRef.update({
                              "status": "Cancelled",
                            });

                            final bookedscheduleRef =
                            db.collection("schedules_booked").doc('$year');
                            bookedscheduleRef.update({
                              "$day": FieldValue.arrayRemove([slot]),
                            });

                            final scheduleRef = db.collection("schedules").doc('$year');
                            scheduleRef.update({
                              "$day": FieldValue.arrayUnion([slot]),
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            backgroundColor: Colors.transparent, // Transparent for gradient effect
                            foregroundColor: Colors.white, // Text color
                            shadowColor: Colors.black.withOpacity(0.5), // Shadow effect
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Match border radius of container
                            ),
                          ),
                          child: Text(
                            status == "Booked" ? "Cancel" : "Cancelled",
                          ),
                        ),
                      ),

                      const SizedBox(width: 20), // Add spacing between buttons
                      // Details Button
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orangeAccent, Colors.yellowAccent], // Two colors for the gradient
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add navigation or dialog logic for details here
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Appointment Details"),
                                content: Text(
                                  'Name: $name\n'
                                      'Date: ${DateFormat('dd/MM/yyyy').format(date)}\n'
                                      'Slot: ${slot < 12 ? "$slot AM" : slot == 12 ? "$slot Noon" : "${slot - 12} PM"}\n'
                                      'Contact: $telephone\n'
                                      'Address: $address\n'
                                      'Status: $status',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Close"),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            backgroundColor: Colors.transparent, // Transparent to show gradient
                            shadowColor: Colors.black.withOpacity(0.5), // Shadow effect
                            foregroundColor: Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Match border radius of gradient
                            ),
                          ),
                          child: const Text("Details"),
                        ),
                      ),


                    ],
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
