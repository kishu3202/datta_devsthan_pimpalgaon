import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HavanBookingScreen extends StatefulWidget {
  const HavanBookingScreen({super.key});

  @override
  State<HavanBookingScreen> createState() => _HavanBookingScreenState();
}

class _HavanBookingScreenState extends State<HavanBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('हवन',style: TextStyle(color: Colors.white,fontSize: 18)),
      centerTitle: true,),
    );
  }
}
