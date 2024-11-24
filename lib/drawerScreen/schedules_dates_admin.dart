/**
 * NOT NEEDED
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'schedules_slots_admin.dart';

class SchedulesDatesAdminScreen extends StatefulWidget {
  const SchedulesDatesAdminScreen({super.key, required this.year});
  final int year;

  @override
  State<StatefulWidget> createState() => _SchedulesDatesAdminScreenState();
}

class _SchedulesDatesAdminScreenState extends State<SchedulesDatesAdminScreen> {


  @override
  Widget build(BuildContext context) {
    final berlinWallFell = DateTime.utc(widget.year, 1, 1);
    final dDay = DateTime.utc(widget.year, 12, 31);
    final days = dDay.difference(berlinWallFell).inDays+1;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Schedules Dates(Admin)',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            for (int day = 1; day <= days; day++)
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SchedulesSlotsAdminScreen(
                            date: DateFormat('dd/MMM/yyyy').format(
                              DateTime(widget.year, 1, 1).add(Duration(days: day-1))), day: day, year: widget.year,
                          )),
                    );
                  },
                  child: ListTile(
                    title: Text(DateFormat('dd/MMM/yyyy').format(
                        DateTime(widget.year, 1, 1).add(Duration(days: day-1)))),
                  ))
          ],
        ));
  }
}
