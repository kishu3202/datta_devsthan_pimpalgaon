import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(title: Text('नित्यसेवा',style: TextStyle(color: Colors.white,fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image(image: AssetImage("asset/images/namsmaran.jpeg"),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image(image:AssetImage('asset/images/namsmaran1.jpeg') ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
