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
      appBar: AppBar(title: const Text("श्री दत्त महाराज अभिषेक सेवा",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
child: Column(
  children: [
const Padding(
  padding: EdgeInsets.all(10.0),
  child: Image(image: AssetImage("asset/images/abhishek.jpeg"),),
),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: const Image(image:AssetImage('asset/images/abhishek1.jpeg') ),
    )
  ],
),
      ),
    );
  }
}
