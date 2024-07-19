import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationsQuery = FirebaseFirestore.instance
      .collection('notifications');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification",style: TextStyle(color: Colors.white,fontSize: 18)),
        centerTitle: true,
      ),
      body:  FirestoreListView<Map<String, dynamic>>(
        emptyBuilder: (context) => const Text('You have no notifications'),
        query: notificationsQuery,
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> appointment = snapshot.data();
          final String message = appointment['message'];

          return ListTile(
            title: Text(message),
          );
        },
      ),
    );
  }
}
