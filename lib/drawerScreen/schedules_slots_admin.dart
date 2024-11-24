import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchedulesSlotsAdminScreen extends StatefulWidget {
  const SchedulesSlotsAdminScreen({
    super.key,
    required this.date,
    required this.day,
    required this.year,
  });

  final String date;
  final int day;
  final int year;

  @override
  State<StatefulWidget> createState() => _SchedulesSlotsAdminScreenState();
}

class _SchedulesSlotsAdminScreenState extends State<SchedulesSlotsAdminScreen> {
  final db = FirebaseFirestore.instance;
  Map<String, dynamic>? schedule;
  Map<String, dynamic>? bookedSchedule;

  @override
  void initState() {
    super.initState();
    final docRefSchedule = db.collection("schedules").doc("${widget.year}");
    docRefSchedule.snapshots().listen(
      (event) {
        //print("current data: ${event.data()}");
        setState(() {
          schedule = event.data();
        });
      },
      onError: (error) => print("Listen failed: $error"),
    );
    final docRefBookedSchedule =
        db.collection("schedules_booked").doc("${widget.year}");
    docRefBookedSchedule.snapshots().listen(
      (event) {
        //print("current data: ${event.data()}");
        setState(() {
          bookedSchedule = event.data();
        });
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List slots = schedule?["${widget.day}"] ?? [];
    final List bookedSlots = bookedSchedule?["${widget.day}"] ?? [];
    return Scaffold(
        appBar: AppBar(
          title: Text('Slots ${widget.date}/(${widget.day}) (Admin)',
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            for (int i = 1; i <= 23; i++)
              if (bookedSlots.contains(i))
                ListTile(
                  title: Text("$i ${i<12?"am":i==12?"noon":"pm"}"),
                  subtitle: const Text("Booked"),
                )
              else if (slots.contains(i))
                ListTile(
                  title: Text("$i ${i<12?"am":i==12?"noon":"pm"}"),
                  subtitle: const Text("Scheduled"),
                  trailing: TextButton(
                    onPressed: () {
                      final scheduleRef = db
                          .collection("schedules")
                          .doc('${widget.year}');
                      scheduleRef.set({
                        "${widget.day}": FieldValue.arrayRemove([i]),
                      },SetOptions(merge: true));
                    },
                    child: const Text("UnSchedule"),
                  ),
                )
              else
                ListTile(
                  title: Text("$i ${i<12?"am":i==12?"noon":"pm"}"),
                  subtitle: const Text("Unscheduled"),
                  trailing: TextButton(
                    onPressed: () {
                      final scheduleRef = db
                          .collection("schedules")
                          .doc('${widget.year}');
                      scheduleRef.set({
                        "${widget.day}": FieldValue.arrayUnion([i]),
                      },SetOptions(merge: true));
                    },
                    child: const Text("Schedule"),
                  ),
                )
          ],
        ));
  }
}
