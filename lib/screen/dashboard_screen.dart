import 'package:datta_devsthan_pimpalgaon/drawerScreen/dipdan_screen.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_booking.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_screen.dart';
import 'package:flutter/material.dart';
import '../drawerScreen/aratiScreen/aratiScreen.dart';
import '../drawerScreen/contact_screen.dart';
import '../drawerScreen/donation_screen.dart';
import '../drawerScreen/nityaseva_screen.dart';
import '../drawerScreen/seva_marge_screen.dart';
import '../drawerScreen/youtube_screen.dart';
import 'home_screen.dart';

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
  title: Text("श्री गुरुदेव दत्त धाम ट्रस्ट,पिंपळगाव", style: TextStyle(color: Colors.white, fontSize: 16),),
  centerTitle: true,
  actions: [
    IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.white,)),
    IconButton(onPressed: (){
      showMessage(context, 'तुम्हाला खात्री आहे का तुम्ही एप्लिकेशनच्या बाहेर पडत आहात ?');
    }, icon: Icon(Icons.logout, color: Colors.white,))
  ],
      ),
      drawer:Drawer(backgroundColor: Colors.orange,
        child: ListView(
          children: [
            DrawerHeader(decoration: BoxDecoration(
              color: Colors.white,
            ),
              child: Column(
                children: [
                  ClipRRect(child: Image.asset("asset/images/loginImage.jpeg", height: 120, width: 200,),
                    // borderRadius: BorderRadius.circular(30),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.orange,
              child: Column(children: [
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => DashboardScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white,),
                    title: Text('Home',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => SevaMargScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.temple_hindu, color: Colors.white,),
                    title: Text('सेवामार्ग',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => NityasevaScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.book, color: Colors.white,),
                    title: Text('नित्यसेवा',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => AratiScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.book_online, color: Colors.white,),
                    title: Text('आरती संग्रह',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => HavanScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.list_alt, color: Colors.white,),
                    title: Text('हवन बुकिंग',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => DipdanScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.temple_hindu, color: Colors.white,),
                    title: Text('दीपदान',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => YoutubeScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.play_circle_outline, color: Colors.white,),
                    title: Text('YouTube',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => DonationScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.money, color: Colors.white,),
                    title: Text('देणगी',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => ContactScreen()),);
                },
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.white,),
                    title: Text('संपर्क',style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white,),
                  title: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 18),),
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
