import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


import 'auth_gate.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//   final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);
//
//   final token = await FirebaseMessaging.instance.getToken();
//   if (token != null) {
//     print("token $token");
//     final user=FirebaseAuth.instance.currentUser;
//     if(user!=null){
//
//       //make firestore operation to update token in users collection
//       final db = FirebaseFirestore.instance;
//       final userRef = db.collection("users").doc(user.uid);
//
// // Atomically add a new token to the "deviceTokens" array field.
//       userRef.update({
//         "deviceTokens": FieldValue.arrayUnion([token]),
//       });
//
//
//     }
//   }

  // FirebaseMessaging.instance.onTokenRefresh
  //     .listen((fcmToken) {
  //   // TODO: If necessary send token to application server.
  //
  //   // Note: This callback is fired at each app startup and whenever a new
  //   // token is generated.
  // })
  //     .onError((err) {
  //   // Error getting token.
  // });

  runApp(const DattaDevsthanPimpalgaon());
}

class DattaDevsthanPimpalgaon extends StatelessWidget {
  const DattaDevsthanPimpalgaon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.orange),
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

