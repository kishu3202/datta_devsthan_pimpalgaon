// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
//
// class UsersAdminScreen extends StatefulWidget {
//   const UsersAdminScreen({super.key});
//
//   @override
//   State<UsersAdminScreen> createState() =>
//       _UsersAdminScreenState();
// }
//
// class _UsersAdminScreenState extends State<UsersAdminScreen> {
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
import 'havanScreen/user_havan_appoinments_admin.dart';

class UsersAdminScreen extends StatefulWidget {
  const UsersAdminScreen({super.key});

  @override
  State<UsersAdminScreen> createState() => _UsersAdminScreenState();
}

class _UsersAdminScreenState extends State<UsersAdminScreen> {
  final db = FirebaseFirestore.instance;
  final usersQuery = FirebaseFirestore.instance.collection("trust_users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users (Admin)',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FirestoreListView<Map<String, dynamic>>(
          emptyBuilder: (context) => const Center(
            child: Text(
              'No users found.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          query: usersQuery,
          itemBuilder: (context, snapshot) {
            Map<String, dynamic> user = snapshot.data();

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserHavanBookingAdminScreen(userId: user['userId']),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'नाव: ',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent, // Title color
                                ),
                              ),
                              TextSpan(
                                text: user['name'] ?? 'N/A',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54, // Text color
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'पत्ता: ',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrangeAccent, // Label color
                                          ),
                                        ),
                                        TextSpan(
                                          text: user['address'] ?? 'No Address',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54, // Value color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'फोन नंबर: ',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrangeAccent, // Label color
                                          ),
                                        ),
                                        TextSpan(
                                          text: user['phone'] ?? 'No Phone',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54, // Value color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'ईमेल: ',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrangeAccent, // Label color
                                          ),
                                        ),
                                        TextSpan(
                                          text: user['email'] ?? 'No Email',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54, // Value color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Wrap(
                          spacing: 8,
                          children: [
                            for (String xcase in user['cases'] ?? [])
                              Chip(
                                label: Text(
                                  xcase,
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                                backgroundColor: Colors.orangeAccent,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
