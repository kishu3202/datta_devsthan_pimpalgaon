import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/dipdan_screen.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/havanScreen/havan_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import '../Login/update_user_form.dart';
import '../auth_gate.dart';
import '../drawerScreen/aratiScreen/aratiScreen.dart';
import '../drawerScreen/contact_screen.dart';
import '../drawerScreen/donation_screen.dart';
import '../drawerScreen/havan_admin.dart';
import '../drawerScreen/nityaseva_screen.dart';
import '../drawerScreen/schedules_admin.dart';
import '../drawerScreen/seva_marge_screen.dart';
import '../drawerScreen/users_admin.dart';
import '../drawerScreen/youtube_screen.dart';
import '../main.dart';
import 'notification_screen.dart';
//import 'package:url_launcher/link.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  final db = FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  bool isAdmin=false;


  @override
  void initState(){
    super.initState();


    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    //check if user is an admin
    final userRef = db.collection("trust_users").doc(auth.currentUser!.uid);
    userRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data["isAdmin"]==true){
          setState(() {
            isAdmin=true;
          });
        }
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );

  }
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
            onPressed: () async{

              final docRef = db.collection("trust_users").doc(FirebaseAuth.instance.currentUser!.uid);

              final response= await docRef.get();
              final data=response.data();



              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => Scaffold(
                    body: ProfileScreen(
                      children:[

                        ListTile(title:Text(data?['phone']),subtitle:Text(data?['address']),
                        trailing: TextButton(child: Text('Edit'),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  UserUpdatePage(phone: data?['phone'],address: data?['address'],)),
                            );

                          },))

                       ],
                      actions: [
                        SignedOutAction((context) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AuthGate()),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(isAdmin: isAdmin,)));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                height: 200,
                width: 300,
                // width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('asset/images/maharaj.jpg'),),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.yellowAccent.shade400.withOpacity(0.9), Colors.orangeAccent.shade400.withOpacity(0.9)], // Define your two colors here
                  begin: Alignment.topLeft, /// Adjust the gradient's start and end points as needed
                  end: Alignment.bottomRight,),),
                child: ScrollLoopAutoScroll(
                    child: Text(
                      "|| ओम श्री गुरुदेव दत्त ओम || || ओम नमः शिवाय ओम ||",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    scrollDirection: Axis.horizontal,
                    delay: Duration(seconds: 1),
                    duration: Duration(seconds: 50),
                    gap: 25,
                    reverseScroll: false,
                    duplicateChild: 25,
                    enableScrollInput: true,
                    delayAfterScrollInput: Duration(seconds: 1)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Column(
              children: [
                Text('खूप मोठ्या प्रमाणात दत्त महाराजांच्या आशीर्वादाने कृपेने खूप मोठ्या प्रमाणात कार्य चालू आहे तरी याचा लाभ घ्यावा. त्रासलेले भक्त आहेत त्यांनी पिंपळगाव बुद्रुक येथे येऊन या कार्याचा लाभ घ्यावा. श्री गुरुदेव दत्त धाम पिंपळगाव बुद्रूक ९३०९२७३६१९. श्री गुरुदेव दत्त कुटुंबाचं पाच कोटी केलं नुकसान, कुटुंब केलं उध्वस्त आश्या भक्तांना वाईट शक्तींचा त्रास होतो, त्यांनाच त्या वेदना कळतात. काही लोक म्हणतात हे काय नसत पण ज्याच जळत त्यालाच कळत🙏🏻🙏🏻कुठ्ल्याही प्रकारचा बळी देऊ नये. नरबळी देणे कायद्यानं गुन्हा आहे.  कुटलाही देव पशुबळी, नरबळी मागत नाही. कुठल्याही प्रकारचे उतारे करू नये, अंधश्रध्देच्या बळी पडू नये ही विनंती. वेदिक पुराणानुसार (मंत्र चिकिस्ता) वाईट शक्तीला एकमेव पर्याय होम हवन करणे.  श्रद्धा ठेवा अंधश्रद्धा ठेऊ नका. अवधूत चिंतन श्री गुरुदेव दत्त🙏🏻🙏🏻', style: TextStyle(fontSize: 18, color: Colors.orange),),
              ],
            ),
          ),
        ],
      ),

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
                        MaterialPageRoute(builder: (context) =>  DipdanScreen()),
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
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //       builder: (context) =>  YoutubeScreen()),
                  //     // );
                  //   },
                  //   child: const ListTile(
                  //     leading: Icon(
                  //       Icons.play_circle_outline,
                  //       color: Colors.white,
                  //     ),
                  //     title: Text(
                  //       'YouTube',
                  //       style: TextStyle(color: Colors.white, fontSize: 18),
                  //     ),
                  //   ),
                  // ),
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
                  if(isAdmin)
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
                  if(isAdmin)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SchedulesAdminScreen()),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Schedules (Admin)',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  if(isAdmin)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UsersAdminScreen()),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Users (Admin)',
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