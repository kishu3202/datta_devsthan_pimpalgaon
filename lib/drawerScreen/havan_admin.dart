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
          final Timestamp date = appointment['date'];
          final String slot = appointment['slot'];
          final String telephone = appointment['telephone'];
          final String address = appointment['address'];
          return ListTile(
            subtitle: Text(
                'Date: ${DateFormat.yMMMd().format(date.toDate())} slot: $slot contact: $telephone \n $address'),
            title: Text(name),
          );
        },
      ),

    );
  }
}
