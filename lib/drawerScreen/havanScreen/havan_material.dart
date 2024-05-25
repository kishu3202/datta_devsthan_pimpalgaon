import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(title: Text('हवन साहित्य',style: TextStyle(color: Colors.white,fontSize: 18)),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image(image:AssetImage('asset/images/havan.jpeg') ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
