

import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("देणगी",style: TextStyle(color: Colors.white,fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
  child: const Image(image: AssetImage('asset/images/scannerImage.jpeg'),),
),
],
      ),
    );
  }
}
