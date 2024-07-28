import 'package:flutter/material.dart';

class HavanMaterial extends StatefulWidget {
  const HavanMaterial({super.key});

  @override
  State<HavanMaterial> createState() => _HavanMaterialState();
}

class _HavanMaterialState extends State<HavanMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('हवन साहित्य',style: TextStyle(color: Colors.white,fontSize: 18)),centerTitle: true,),
      body: const SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(image:AssetImage('asset/images/havan.jpeg') ),
            ),
          ],
        ),
      ),
    );
  }
}
