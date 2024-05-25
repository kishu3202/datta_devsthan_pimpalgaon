import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/devi_arati.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/prathana.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DattaguruArati extends StatefulWidget {
  const DattaguruArati({super.key});

  @override
  State<DattaguruArati> createState() => _DattaguruAratiState();
}

class _DattaguruAratiState extends State<DattaguruArati> {
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
                            builder: (context) => DeviArati(
                            )));
                  }, icon: Icon(Icons.keyboard_double_arrow_left), color: Colors.white,iconSize: 30),
                  SizedBox(width: 50,),
                  Text("श्री दत्तात्रेयांची आरती", style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(width: 60,),
                  IconButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrathanaScreen(
                            )));
                  }, icon: Icon(Icons.keyboard_double_arrow_right), color: Colors.white,iconSize: 30)
                ],
              ),
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellowAccent.shade400.withOpacity(0.9), Colors.orangeAccent.shade400.withOpacity(0.9)], // Define your two colors here
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
                Text('त्रिगुणात्मक त्रैमूर्ती दत्त हा जाणा |', style: TextStyle(fontSize: 18),),
                Text('त्रिगुणी अवतार  त्रैलोक्याराणा |', style: TextStyle(fontSize: 18),),
                Text('नेती नेती शब्द न ये अनुमाना |', style: TextStyle(fontSize: 18),),
                Text('सुरवर मुनिजन योगी समाधि नमस्कार ये ध्याना ||१||', style: TextStyle(fontSize: 18),),
                SizedBox(height: 20,),
                Text('जय देव जय देव जय श्री गुरूदत्ता |', style: TextStyle(fontSize: 18),),
                Text('आरती ओवाळीतां हरली भवचिन्ता ||ध्रु||', style: TextStyle(fontSize: 18),),
                SizedBox(height: 20,),
                Text('सबाह्य अभ्यंतरी तू एक दत्त |', style: TextStyle(fontSize: 18),),
                Text('अभाग्यासी कैसी न कळे ही मात |', style: TextStyle(fontSize: 18),),
                Text('पराही परतली तेथे कैचा हेत |', style: TextStyle(fontSize: 18),),
                Text('जन्ममरणाचा पुरलासे अंत ||२||', style: TextStyle(fontSize: 18),),
                SizedBox(height: 20,),
                Text('दत्त येउनियां ऊभा ठाकला |', style: TextStyle(fontSize: 18),),
                Text('सद्भावे साष्टांगे प्रणिपात केला |', style: TextStyle(fontSize: 18),),
                Text('प्रसन्न होऊनी आशीर्वाद दिधला |', style: TextStyle(fontSize: 18),),
                Text('जन्ममरणाचा फेरा चुकविला ||३||', style: TextStyle(fontSize: 18),),
                SizedBox(height: 20,),
                Text('दत्त दत्त ऐसे लागले ध्यान |', style: TextStyle(fontSize: 18),),
                Text('हरपले मन झाले उन्मन |', style: TextStyle(fontSize: 18),),
                Text('मी तू पणाची झाली बोळवण |', style: TextStyle(fontSize: 18),),
                Text('एका जनार्दनी श्रीदत्तध्यान ||४||', style: TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
