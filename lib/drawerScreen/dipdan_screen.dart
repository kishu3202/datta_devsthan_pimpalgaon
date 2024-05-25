import 'package:flutter/material.dart';

class DipdanScreen extends StatefulWidget {
  const DipdanScreen({super.key});

  @override
  State<DipdanScreen> createState() => _DipdanScreenState();
}

class _DipdanScreenState extends State<DipdanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("दीपदान",style: TextStyle(color: Colors.white,fontSize: 18),),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image(image: AssetImage("asset/images/dipdan.jpeg"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
