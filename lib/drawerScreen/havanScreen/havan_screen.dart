import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_booking.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HavanScreen extends StatefulWidget {
  const HavanScreen({super.key});

  @override
  State<HavanScreen> createState() => _HavanScreenState();
}

class _HavanScreenState extends State<HavanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('हवन बुकिंग',style: TextStyle(color: Colors.white,fontSize: 18)), centerTitle: true,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Container(height: 80,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HavanMaterial(
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "हवन साहित्य",
                          style: TextStyle(
                            color: Colors.orange, // Set the text color
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(height: 80,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HavanBookingScreen(
                            )));
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "हवन बुकिंग",
                          style: TextStyle(
                            color: Colors.orange, // Set the text color
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
