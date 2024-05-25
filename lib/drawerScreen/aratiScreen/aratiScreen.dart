import 'package:flutter/material.dart';

class AratiScreen extends StatefulWidget {
  const AratiScreen({super.key});

  @override
  State<AratiScreen> createState() => _AratiScreenState();
}

class _AratiScreenState extends State<AratiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arati"),
        centerTitle: true,
      ),
    );
  }
}
