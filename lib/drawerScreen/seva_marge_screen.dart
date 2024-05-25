import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SevaMargScreen extends StatefulWidget {
  const SevaMargScreen({super.key});

  @override
  State<SevaMargScreen> createState() => _SevaMargScreenState();
}

class _SevaMargScreenState extends State<SevaMargScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("सेवामार्ग",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
    );
  }
}
