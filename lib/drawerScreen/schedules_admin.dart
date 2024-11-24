import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/schedules_slots_admin.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../common/custom_calender_date_picker.dart';

import 'schedules_dates_admin.dart';

class SchedulesAdminScreen extends StatefulWidget {
  const SchedulesAdminScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SchedulesAdminScreenState();
}

class _SchedulesAdminScreenState extends State<SchedulesAdminScreen> {
  final GlobalKey _calendarPickerKey = GlobalKey();
  final usersQuery = FirebaseFirestore.instance.collection('schedules');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedules (Admin)',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: CustomCalendarDatePicker(
        key: _calendarPickerKey,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        onDateChanged: (date) {
          //print(date);
         final year= date.year;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  SchedulesSlotsAdminScreen(
                    date: DateFormat('dd/MMM/yyyy').format(date), day:  int.parse(DateFormat('D').format(date)), year: year,
                  )));
        },

        // key: _calendarPickerKey,
        // initialDate: _selectedDate.value,
        // firstDate: widget.firstDate,
        // lastDate: widget.lastDate,
        // currentDate: widget.currentDate,
        // onDateChanged: _handleDateChanged,
        // selectableDayPredicate: widget.selectableDayPredicate,
        // initialCalendarMode: widget.initialCalendarMode,
      ),
    );
  }
}
