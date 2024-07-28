import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/dattaguru_arati.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/ganpati_arati.dart';
import 'package:flutter/material.dart';

class DeviArati extends StatefulWidget {
  const DeviArati({super.key});

  @override
  State<DeviArati> createState() => _DeviAratiState();
}

class _DeviAratiState extends State<DeviArati> {
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
                    IconButton(onPressed: (){
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GanpatiArati(
                              )));
                    }, icon: const Icon(Icons.keyboard_double_arrow_left), color: Colors.white,iconSize: 30),
                    const SizedBox(width: 60,),
                    const Text("श्री देवीची आरती", style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(width: 80,),
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DattaguruArati(
                              )));
                    }, icon: const Icon(Icons.keyboard_double_arrow_right), color: Colors.white,iconSize: 30)
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('दुर्गे दुर्घट भारी तुजविण संसारी |', style: TextStyle(fontSize: 18),),
                  Text('अनाथ नाथे अंबे करुणा विस्तारी |', style: TextStyle(fontSize: 18),),
                  Text('वारी वारी जन्म मरणांते वारी |', style: TextStyle(fontSize: 18),),
                  Text('हारी पडलो आता संकट निवारी ||१||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('जय देवी जय देवी महिषा सुरमथिनी |', style: TextStyle(fontSize: 18),),
                  Text('सुरवर ईश्वर वरदे तारक संजीवनी ||ध्रु||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('त्रिभुवनी भुवनी पाहता तुज ऐसी नाही |', style: TextStyle(fontSize: 18),),
                  Text('चारी श्रमले परंतू न बोलवे काही |', style: TextStyle(fontSize: 18),),
                  Text('साही विवाद करिता पडिले प्रवाही |', style: TextStyle(fontSize: 18),),
                  Text('ते तू भक्तांलागी पावसि लवलाही ||२||', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('प्रसन्नवदने प्रसन्न होती निजदासा |', style: TextStyle(fontSize: 18),),
                  Text('क्लेशांपासुनि सोडी तोडी भवपाशा |', style: TextStyle(fontSize: 18),),
                  Text('अंबे तुजवांचून कोण पुरविल आशा |', style: TextStyle(fontSize: 18),),
                  Text('नरहरी तल्लीन झाला पदपंकजलेशा ||३||', style: TextStyle(fontSize: 18),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
