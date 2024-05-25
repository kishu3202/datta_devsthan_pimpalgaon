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
    );
  }
}
