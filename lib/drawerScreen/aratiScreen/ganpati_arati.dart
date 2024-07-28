import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/aratiScreen.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/devi_arati.dart';
import 'package:flutter/material.dart';

class GanpatiArati extends StatefulWidget {
  const GanpatiArati({super.key});

  @override
  State<GanpatiArati> createState() => _GanpatiAratiState();
}

class _GanpatiAratiState extends State<GanpatiArati> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("आरती संग्रह",style: TextStyle(color: Colors.white,fontSize: 18),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.yellowAccent.shade400.withOpacity(0.9), Colors.orangeAccent.shade400.withOpacity(0.9)], // Define your two colors here
                    begin: Alignment.topLeft, // Adjust the gradient's start and end points as needed
                    end: Alignment.bottomRight,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    IconButton(onPressed: (){ Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AratiScreen(
                            )));}, icon: const Icon(Icons.keyboard_double_arrow_left), color: Colors.white,iconSize: 30),
                    const SizedBox(width: 50,),
                    const Text("श्री गणपतीची आरती", style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(width: 65,),
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DeviArati(
                              )));
                    }, icon: const Icon(Icons.keyboard_double_arrow_right), color: Colors.white, iconSize: 30,)
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('सुखकर्ता दुःखहर्ता वार्ता विघ्नाची |', style: TextStyle(fontSize: 18),),
                  Text('नुरवी पुरवी प्रेम कृपा जयाची |', style: TextStyle(fontSize: 18),),
                  Text('सर्वांगी सुंदर उटी शेंदुराची |', style: TextStyle(fontSize: 18),),
                  Text('कंठी झळके माळ मुक्ता फळांची ||१||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('जय देव जय देव जय मंगलमूर्ती |', style: TextStyle(fontSize: 18),),
                  Text('दर्शन मात्रे मन कामना पुरती ||ध्रु||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('रत्नखचित फरा तूज गौरीकुमरा |', style: TextStyle(fontSize: 18),),
                  Text('चंदनाची उटी कुमकुमकेशरा |', style: TextStyle(fontSize: 18),),
                  Text('हिरे जडीत मुकुट शोभतो बरा |', style: TextStyle(fontSize: 18),),
                  Text('जरुणझुणती नुपुरे चरणी घागरिया ||२||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('लंबोदर पितांबर फणी वरवंदना |', style: TextStyle(fontSize: 18),),
                  Text('सरळ सोंड वक्रतुंड त्रिनयना |', style: TextStyle(fontSize: 18),),
                  Text('दास रामाचा वाट पाहे सदना |', style: TextStyle(fontSize: 18),),
                  Text('संकटी पावावे निर्वाणी रक्षावे सुरवंदना ||३||', style: TextStyle(fontSize: 18),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
