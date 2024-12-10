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
import 'package:intl/intl.dart';

import 'havanScreen/user_havan_appoinments_admin.dart';

class UsersAdminScreen extends StatefulWidget {
  const UsersAdminScreen({super.key});

  @override
  State<UsersAdminScreen> createState() =>
      _UsersAdminScreenState();
}

class _UsersAdminScreenState extends State<UsersAdminScreen> {
  final db = FirebaseFirestore.instance;
  final usersQuery = FirebaseFirestore.instance
      .collection("trust_users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users (Admin)',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
        actions: [
          //TextField(),
        IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        emptyBuilder: (context) => const Text('You have no appointments'),
        query: usersQuery,
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> user = snapshot.data();

          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   UserHavanBookingAdminScreen(userId:user['userId'] ,)),
              );

            },
            child: Card(

              child: Row(
                children: [
                  Expanded(
                    child: ListTile(title: Text(user?['name']),
                    subtitle: Column(
                      children: [
                        Text(user['address'] ,
                        ),Text(user['phone']),
                        Text(user['email']),

                      ],

                    ),
                    ),
                  ),
                  Column(children: [
                    for(String xcase in user['cases']??[])
                      Text(xcase)

                  ],)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
