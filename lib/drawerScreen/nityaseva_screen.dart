import 'package:flutter/material.dart';

class NityasevaScreen extends StatefulWidget {
  const NityasevaScreen({super.key});

  @override
  State<NityasevaScreen> createState() => _NityasevaScreenState();
}

class _NityasevaScreenState extends State<NityasevaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('नित्यसेवा',style: TextStyle(color: Colors.white,fontSize: 18)),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(image: AssetImage("asset/images/namsmaran.jpeg"),),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(image:AssetImage('asset/images/namsmaran1.jpeg') ),
            )
          ],
        ),
      ),
    );
  }
}
