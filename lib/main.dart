import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'auth_gate.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
