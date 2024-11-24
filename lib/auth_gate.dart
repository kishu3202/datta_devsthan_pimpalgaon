import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'screen/dashboard_screen.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print ("helloo");

          return  SignInScreen(
            headerBuilder: (context, constraints, num){
              return  Padding(
                padding: const EdgeInsets.only(top:25.0),
                child: ClipRRect(
                  child: Image.asset(
                    "asset/images/loginImage.jpeg",
                    height: 100,
                    width: 100,
                  ),
                  // borderRadius: BorderRadius.circular(30),
                ),
              );
            },
            providers: [EmailAuthProvider(),],
          );

        }
        setupToken();
        return const DashboardScreen();
        //return const HavanBookingScreen();
      },
    );
  }
}