import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


import 'package:intl/intl.dart';

import 'havan_booking_form.dart';class HavanBookingScreen extends StatefulWidget {
  const HavanBookingScreen({super.key});

  @override
  State<HavanBookingScreen> createState() => _HavanBookingScreenState();
}

class _HavanBookingScreenState extends State<HavanBookingScreen> {
  final usersQuery = FirebaseFirestore.instance.collection('appointments').where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('हवन',style: TextStyle(color: Colors.white,fontSize: 18)),
      centerTitle: true,),
      body: FirestoreListView<Map<String, dynamic>>(
        emptyBuilder:(context)=>const Text('You have no appointments'),
        query: usersQuery,
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> appointment = snapshot.data();
          final String name=appointment['name'];
          final Timestamp date= appointment['date'];
          final String slot=appointment['slot'];
          return ListTile(subtitle: Text('Date: ${DateFormat.yMMMd().format(date.toDate())} slot: $slot'),
          title: Text(name),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HavanBooking(
                  )));
        },
        tooltip: 'Add Booking',
        child: const Icon(Icons.add),
      ),
    );
  }
}
