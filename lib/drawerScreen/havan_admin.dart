import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class HavanBookingAdminScreen extends StatefulWidget {
  const HavanBookingAdminScreen({super.key});

  @override
  State<HavanBookingAdminScreen> createState() => _HavanBookingAdminScreenState();
}

class _HavanBookingAdminScreenState extends State<HavanBookingAdminScreen> {
  final usersQuery = FirebaseFirestore.instance
      .collection('appointments');

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
          final String name = appointment['name'];
          final int year = appointment['schedule'];
          final int day = appointment['day'];
          final int slot = appointment['slot'];
          final String telephone = appointment['telephone'];
          final String address = appointment['address'];

          // to calculte date from day of year and year
          // ref: https://stackoverflow.com/questions/60282195/how-to-get-date-given-only-the-day-of-year-number-in-flutter
          final dayOfYear = day;
          final millisInADay = const Duration(days: 1).inMilliseconds; // 86400000
          final millisDayOfYear = dayOfYear * millisInADay;
          final millisecondsSinceEpoch = DateTime(year).millisecondsSinceEpoch;

          var dayOfYearDate = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch + millisDayOfYear);
          return ListTile(
            subtitle: Text(
                'Date: ${DateFormat('dd/MM/yyyy').format(dayOfYearDate.subtract(const Duration(days: 1)))} slot: $slot contact: $telephone \n$address'),
            title: Text(name),
          );
        },
      ),

    );
  }
}
