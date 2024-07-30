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
      .collection('users/${FirebaseAuth.instance.currentUser!.uid}/appointments')

      .orderBy("bookingDate", descending: true);
      // .orderBy("schedule", descending: true)
      // .orderBy("day", descending: true)
      // .orderBy("slot");

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
          final String status=appointment['status']??'Booked';
          // to calculate date from day of year and year
          // ref: https://stackoverflow.com/questions/60282195/how-to-get-date-given-only-the-day-of-year-number-in-flutter
          //final dayOfYear = day;
          // final millisInADay =
          //     const Duration(days: 1).inMilliseconds; // 86400000
          // final millisDayOfYear = dayOfYear * millisInADay;
          // final millisecondsSinceEpoch = DateTime(year).millisecondsSinceEpoch;
          // final dayOfYearDate = DateTime.fromMillisecondsSinceEpoch(
          //     millisecondsSinceEpoch + millisDayOfYear);

          var date = DateTime(year, 1, 1).add(Duration(days: day - 1));
          return ListTile(
            subtitle: Text(
                'Date: ${DateFormat('dd/MM/yyyy').format(date)} ($day) slot: $slot'),
            title: Text(name),
            trailing: Text(status),
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

///Date picker

/// Flutter code sample for.

//void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DatePickerExample(restorationId: 'main');
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
  Map<String, dynamic> schedule = {};

  @override
  void initState() {
    super.initState();
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

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final docRef = FirebaseFirestore.instance
  //       .collection("schedules")
  //       .doc('${DateTime.now().year}');
  //   docRef.snapshots().listen(
  //     (event) {
  //       setState(() {
  //         schedule = event.data() as Map<String, dynamic>;
  //       });
  //     },
  //     onError: (error) => print("Listen failed: $error"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final currentDayOfYear = DateFormat('D').format(DateTime.now());
    final scheduleDays = schedule.keys.map((e) => int.parse(e)).toList();
    DateTime? initialDate;

    scheduleDays.sort();
    if (scheduleDays.isNotEmpty) {
      for (var i = 0; i < scheduleDays.length; i++) {
        if (scheduleDays[i] == int.parse(currentDayOfYear)) {
          final slotsOfDay = schedule['${scheduleDays[i]}'] as List<dynamic>;
          final currentHour = DateFormat('H').format(DateTime.now());

          var isNotExpired = false;
          for (var element in slotsOfDay) {
            if (element >= int.parse(currentHour)) {
              isNotExpired = true;
              break;
            }
          }
          if (isNotExpired) {
            initialDate = DateTime(DateTime.now().year, 1, 1)
                .add(Duration(days: scheduleDays[i] - 1));

            print("initial date 1:");
            print(initialDate);
            break;
          }
        }
        if (scheduleDays[i] > int.parse(currentDayOfYear)) {
          initialDate = DateTime(DateTime.now().year, 1, 1)
              .add(Duration(days: scheduleDays[i] - 1));
          print("initial date 2:");
          print(initialDate);
          break;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(),
      body: (schedule.isNotEmpty && initialDate != null)
          ? CustomCalendarDatePicker(
              key: _calendarPickerKey,
              initialDate: initialDate,
              firstDate: initialDate,
              lastDate: initialDate.add(const Duration(days: 365)),
              onDateChanged: (date) {
                print(date);
                final dayOfYear = DateFormat('D').format(date);
                final slots = schedule[dayOfYear] as List<dynamic>;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HavanBooking(
                              date: date,
                              slots: slots, dayOfYear: dayOfYear,
                            )));
              },
              selectableDayPredicate: (date) {
                //if (schedule != null && schedule!.isNotEmpty) {
                final dayOfYear = int.parse(DateFormat('D').format(date));
                final currentDay =
                    int.parse(DateFormat('D').format(DateTime.now()));
                print('dayOfYear');
                print(dayOfYear);
                print('currentDay');
                print(currentDay);
                if (schedule.containsKey("$dayOfYear")) {
                  final slotsOfDay = schedule["$dayOfYear"];
                  final currentHour = DateFormat('H').format(DateTime.now());

                  if (dayOfYear == currentDay) {
                    for (var element in slotsOfDay) {
                      if (element >= int.parse(currentHour)) {
                        return true;
                      }
                    }
                  } else if (dayOfYear > currentDay) {
                    return true;
                  }
                  //final isNotFull = slotsOfDay.isNotEmpty;

                  return false;
                } else {
                  return false;
                }
                // }

                // return false;
              },
              // key: _calendarPickerKey,
              // initialDate: _selectedDate.value,
              // firstDate: widget.firstDate,
              // lastDate: widget.lastDate,
              // currentDate: widget.currentDate,
              // onDateChanged: _handleDateChanged,
              // selectableDayPredicate: widget.selectableDayPredicate,
              // initialCalendarMode: widget.initialCalendarMode,
            )
          : const Center(
              child: Text('sorry!!! no schedule available'),
            ),
    );
  }
}
