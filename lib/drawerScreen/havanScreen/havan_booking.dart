import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../common/custom_calender_date_picker.dart';
import 'havan_booking_form.dart';
import '../../common/custom_date_picker.dart';

class HavanBookingScreen extends StatefulWidget {
  const HavanBookingScreen({super.key});

  @override
  State<HavanBookingScreen> createState() => _HavanBookingScreenState();
}

class _HavanBookingScreenState extends State<HavanBookingScreen> {
  final usersQuery = FirebaseFirestore.instance
      .collection('appointments')
      .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('हवन',
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
          // to calculate date from day of year and year
          // ref: https://stackoverflow.com/questions/60282195/how-to-get-date-given-only-the-day-of-year-number-in-flutter
          final dayOfYear = day;
          final millisInADay =
              const Duration(days: 1).inMilliseconds; // 86400000
          final millisDayOfYear = dayOfYear * millisInADay;
          final millisecondsSinceEpoch = DateTime(year).millisecondsSinceEpoch;
          final dayOfYearDate = DateTime.fromMillisecondsSinceEpoch(
              millisecondsSinceEpoch + millisDayOfYear);

          return ListTile(
            subtitle: Text(
                'Date: ${DateFormat('dd/MM/yyyy').format(dayOfYearDate.subtract(const Duration(days: 1)))} slot: $slot'),
            title: Text(name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => /*const HavanBooking()*/
                      const DatePickerApp()));
        },
        tooltip: 'Add Booking',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//Date picker

/// Flutter code sample for.

//void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const DatePickerExample(restorationId: 'main');
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample> {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.

  final GlobalKey _calendarPickerKey = GlobalKey();
  Map<String, dynamic>? schedule;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final docRef = FirebaseFirestore.instance
        .collection("schedules")
        .doc('${DateTime.now().year}');
    docRef.snapshots().listen(
      (event) {
        setState(() {
          schedule = event.data() as Map<String, dynamic>;
        });
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCalendarDatePicker(
        key: _calendarPickerKey,
        initialDate: DateTime.now(),
        //initialEntryMode: DatePickerEntryMode.calendarOnly,
        //initialDate:  DateTime.now() ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        onDateChanged: (date) {
          print(date);
          final dayOfYear = DateFormat('D').format(date);
          final slots=schedule![dayOfYear] as List<dynamic>;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  HavanBooking(date: date,slots:slots,)
                  ));
        },
        selectableDayPredicate: (date) {
          if (schedule != null && schedule!.isNotEmpty) {
            final dayOfYear = DateFormat('D').format(date);
            //print(schedule);
            //print(DateFormat('D').format(date));
            if (schedule!.containsKey(dayOfYear)) {
              final slotsOfDay = schedule![dayOfYear] as List<dynamic>;
              final isNotFull = slotsOfDay.isNotEmpty;
              if (isNotFull) {
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          }

          return false;
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
      // body: Center(
      //   child: OutlinedButton(
      //     onPressed: () {
      //       _restorableDatePickerRouteFuture.present();
      //     },
      //     child:
      //
      //     const Text('Choose your Date'),
      //   ),
      // ),
    );
  }
}
