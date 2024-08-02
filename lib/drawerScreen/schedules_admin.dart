import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'schedules_dates_admin.dart';

class SchedulesAdminScreen extends StatefulWidget {
  const SchedulesAdminScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SchedulesAdminScreenState();
}

class _SchedulesAdminScreenState extends State<SchedulesAdminScreen> {
  final usersQuery = FirebaseFirestore.instance.collection('schedules');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedules (Admin)',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        emptyBuilder: (context) => const Text('You have no schedules'),
        query: usersQuery,
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> appointment = snapshot.data();

          final year = int.parse(snapshot.id);

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  SchedulesDatesAdminScreen(
                          year: year,
                        )),
              );
            },
            child: ListTile(
              title: Text('$year'),
            ),
          );
        },
      ),
    );
  }
}
