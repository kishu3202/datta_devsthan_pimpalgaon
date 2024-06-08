import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/dattaguru_arati.dart';
import 'package:flutter/material.dart';

class PrathanaScreen extends StatefulWidget {
  const PrathanaScreen({super.key});

  @override
  State<PrathanaScreen> createState() => _PrathanaScreenState();
}

class _PrathanaScreenState extends State<PrathanaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("आरती संग्रह",style: TextStyle(color: Colors.white,fontSize: 18),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DattaguruArati(
                              )));
                    }, icon: Icon(Icons.keyboard_double_arrow_left), color: Colors.white,iconSize: 30),
                    SizedBox(width: 100,),
                    Text("प्रार्थना", style: TextStyle(fontSize: 18, color: Colors.white)),
                    // SizedBox(width: 110,),
                    // IconButton(onPressed: (){
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => JayJayKarScreen(
                    //           )));
                    // }, icon: Icon(Icons.keyboard_double_arrow_right), color: Colors.white,iconSize: 30)
                  ],
                ),
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.yellowAccent.shade400.withOpacity(0.9), Colors.orangeAccent.shade400.withOpacity(0.9)], // Define your two colors here
                  begin: Alignment.topLeft, // Adjust the gradient's start and end points as needed
                  end: Alignment.bottomRight,),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('घालीन लोटांगण, वंदीन चरण |', style: TextStyle(fontSize: 18),),
                  Text('त्रडोळ्यांनीपाहीन रुप तुझे |', style: TextStyle(fontSize: 18),),
                  Text('प्रेमें आलिंगन, आनंदे पूजिन |', style: TextStyle(fontSize: 18),),
                  Text('भावे ओवाळीन म्हणे नामा ||१||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('त्वमेव माता च पिता त्वमेव |', style: TextStyle(fontSize: 18),),
                  Text('त्वमेव बंधुक्ष्च सखा त्वमेव ||ध्रु||', style: TextStyle(fontSize: 18),),
                  Text('त्वमेव विद्या द्रविणं त्वमेव |', style: TextStyle(fontSize: 18),),
                  Text('त्वमेव सर्वं मम देवदेव |', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('कायेन वाचा मनसेंद्रीयेव्रा |', style: TextStyle(fontSize: 18),),
                  Text('बुद्धयात्मना वा प्रकृतिस्वभावात ||२||', style: TextStyle(fontSize: 18),),
                  Text('करोमि यध्द्यतसकलंपरस्मे|', style: TextStyle(fontSize: 18),),
                  Text('नारायणायेति समर्पयामि |', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('अच्युतंकेशवं रामनारायणं|', style: TextStyle(fontSize: 18),),
                  Text('कृष्णदामोदरं वासुदेवं हरिम ||३||', style: TextStyle(fontSize: 18),),
                  Text('श्रीधरं माधवं गोपिकावल्लभं |', style: TextStyle(fontSize: 18),),
                  Text('जानकीनायकं रामचंद्रभजे |', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('हरे राम हरे राम राम राम हरे हरे |', style: TextStyle(fontSize: 18),),
                  Text('हरे कृष्ण हरे कृष्ण कृष्ण कृष्ण हरे हरे ||४||', style: TextStyle(fontSize: 18),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
