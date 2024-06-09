
import 'package:datta_devsthan_pimpalgaon/drawerScreen/dipdan_screen.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/material.dart';
import '../drawerScreen/aratiScreen/aratiScreen.dart';
import '../drawerScreen/contact_screen.dart';
import '../drawerScreen/donation_screen.dart';
import '../drawerScreen/havan_admin.dart';
import '../drawerScreen/nityaseva_screen.dart';
import '../drawerScreen/seva_marge_screen.dart';
import '../drawerScreen/youtube_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "श्री गुरुदेव दत्त धाम ट्रस्ट,पिंपळगाव",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          // IconButton(onPressed: (){
          //   showMessage(context, 'तुम्हाला खात्री आहे का तुम्ही एप्लिकेशनच्या बाहेर पडत आहात ?');
          // }, icon: Icon(Icons.logout, color: Colors.white,))
        ],
      ),
      body: const Center(child: Text('Welcome to dashboard'),),

      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "asset/images/loginImage.jpeg",
                      height: 120,
                      width: 200,
                    ),
                    // borderRadius: BorderRadius.circular(30),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.orange,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SevaMargScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.temple_hindu,
                        color: Colors.white,
                      ),
                      title: Text(
                        'सेवामार्ग',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NityasevaScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      title: Text(
                        'नित्यसेवा',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AratiScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.book_online,
                        color: Colors.white,
                      ),
                      title: Text(
                        'आरती संग्रह',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HavanScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      ),
                      title: Text(
                        'हवन बुकिंग',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DipdanScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.temple_hindu,
                        color: Colors.white,
                      ),
                      title: Text(
                        'दीपदान',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YoutubeScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        'YouTube',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonationScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                      title: Text(
                        'देणगी',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      title: Text(
                        'संपर्क',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  if(FirebaseAuth.instance.currentUser!.email=='guruaugust@gmail.com')
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HavanBookingAdminScreen()),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      ),
                      title: Text(
                        'हवन बुकिंग (Admin)',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                   ListTile(
                    onTap: (){
                      FirebaseUIAuth.signOut(
                        context: context,

                      );

                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMessage(BuildContext context, String s) {}
}
