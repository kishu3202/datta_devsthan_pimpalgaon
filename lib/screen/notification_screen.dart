import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.isAdmin});
  final bool isAdmin;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final userNotificationsQuery = FirebaseFirestore.instance
      .collection('notifications').where('userId',isEqualTo:FirebaseAuth.instance.currentUser!.uid);

  final adminNotificationsQuery = FirebaseFirestore.instance
      .collection('notifications').where('isAdmin',isEqualTo: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification",style: TextStyle(color: Colors.white,fontSize: 18)),
        centerTitle: true,
      ),
      body:  FirestoreListView<Map<String, dynamic>>(
        emptyBuilder: (context) => const Text('You have no notifications'),
        query: widget.isAdmin?adminNotificationsQuery:userNotificationsQuery,
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
