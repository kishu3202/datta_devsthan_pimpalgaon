import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/booking_form.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_booking.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_material.dart';
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
      appBar: AppBar(title: const Text('हवन बुकिंग',style: TextStyle(color: Colors.white,fontSize: 18)), centerTitle: true,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 60),
            child: SizedBox(height: 80,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HavanMaterial(
                            )));
                  },
                  child: const Center(
                    child: Text(
                      "हवन साहित्य",
                      style: TextStyle(
                        color: Colors.orange, // Set the text color
                        fontSize: 18,
                      ),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 60),
            child: SizedBox(height: 80,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HavanBookingScreen(
                            )));
                  },

                  child: const Center(
                    child: Text(
                      "हवन बुकिंग",
                      style: TextStyle(
                        color: Colors.orange, // Set the text color
                        fontSize: 18,
                      ),
                    ),
                  )),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 60),
          //   child: SizedBox(height: 80,
          //     width: MediaQuery.of(context).size.width,
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             backgroundColor: Colors.white,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //             )),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const HavanForm(
          //                   )));
          //         },
          //
          //         child: const Center(
          //           child: Text(
          //             "हवन अर्ज",
          //             style: TextStyle(
          //               color: Colors.orange, // Set the text color
          //               fontSize: 18,
          //             ),
          //           ),
          //         )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
