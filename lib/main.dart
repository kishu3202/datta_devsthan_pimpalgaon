import 'package:datta_devsthan_pimpalgaon/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(DattaDevsthanPimpalgaon());
}
class DattaDevsthanPimpalgaon extends StatelessWidget {
  const DattaDevsthanPimpalgaon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData(
useMaterial3: false,
  primarySwatch: Colors.orange
),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
