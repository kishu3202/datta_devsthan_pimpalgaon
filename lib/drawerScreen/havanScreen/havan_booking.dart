import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/userDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../common/custom_calender_date_picker.dart';
import 'havan_booking_form.dart';

class HavanBookingScreen extends StatefulWidget {
  const HavanBookingScreen({super.key});

  @override
  State<HavanBookingScreen> createState() => _HavanBookingScreenState();
}

class _HavanBookingScreenState extends State<HavanBookingScreen> {
  final usersQuery = FirebaseFirestore.instance
      .collection('trust_users/${FirebaseAuth.instance.currentUser!.uid}/appointments')
      .orderBy("bookingDate", descending: true);

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
          final String address = appointment['address'];
          final  cases= appointment['cases']??[];
          final String phone = appointment['telephone'];
          final int year = appointment['schedule'];
          final int day = appointment['day'];
          final int slot = appointment['slot'];
          final String status = appointment['status'] ?? 'Booked';


          // To calculate date from day of the year and year
          var date = DateTime(year, 1, 1).add(Duration(days: day - 1));

          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: ${DateFormat('dd/MM/yyyy').format(date)} ($day) ' +
                        'Slot: ${slot < 12 ? "$slot am" : slot == 12 ? "$slot noon" : "${slot - 12} pm"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Status: $status',
                    style: TextStyle(
                        fontSize: 16,
                        color: status == 'Booked' ? Colors.green : Colors.red),
                  ),
              //     const SizedBox(height: 16),
              // Row(children: [
              //   for(String xcase in cases??[])
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(xcase),
              //     )
              //
              // ],
              // ),

                  TextButton(
                    onPressed: () {
                      // Navigate to a detailed page or show dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Userdetails(name: name, address: address, mobileNumber: phone, havanDate: 'Date: ${DateFormat('dd/MM/yyyy').format(date)} ($day) ' +
                              'Slot: ${slot < 12 ? "$slot am" : slot == 12 ? "$slot noon" : "${slot - 12} pm"}', totalHavan: 0, trass: cases,),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 45,// vertical padding for button
                        width: 200,  // Set a fixed width for the button
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellowAccent.withOpacity(0.9), // First color with opacity
                              Colors.orangeAccent.withOpacity(0.9), // Second color with opacity
                            ],
                            begin: Alignment.topLeft, // Gradient starts from the top left
                            end: Alignment.bottomRight, // Gradient ends at the bottom right
                          ),
                          borderRadius: BorderRadius.circular(12), // Border radius
                          // border: Border.all(color: Colors.orangeAccent.withOpacity(0.7), width: 2), // Optional border with opacity
                        ),
                        child: const Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DatePickerApp()));
        },
        tooltip: 'Add Booking',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Date picker

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

class _DatePickerExampleState extends State<DatePickerExample> {
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
        if (mounted) {
          setState(() {
            schedule = event.data() as Map<String, dynamic>;
          });
        }
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

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
            break;
          }
        }
        if (scheduleDays[i] > int.parse(currentDayOfYear)) {
          initialDate = DateTime(DateTime.now().year, 1, 1)
              .add(Duration(days: scheduleDays[i] - 1));
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
          final dayOfYear = int.parse(DateFormat('D').format(date));
          final currentDay =
          int.parse(DateFormat('D').format(DateTime.now()));
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
            return false;
          } else {
            return false;
          }
        },
      )
          : const Center(
        child: Text('sorry!!! no schedule available'),
      ),
    );
  }
}
