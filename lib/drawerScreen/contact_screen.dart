import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("संपर्क",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage("asset/images/dada1.jpg"),),
              ),
            ),
            SizedBox(height: 40,),
            Text('मु. पोस्ट पिंपळगाव बुद्रुक, तालुका कागल,', style: TextStyle(fontSize: 20,color: Colors.orange),),
            Text('जिल्हा कोल्हापूर,महाराष्ट्र', style: TextStyle(fontSize: 20,color: Colors.orange),),
            Text('श्री गुरुदेव दत्त धाम न्यास पिंपळगाव बुद्रुक', style: TextStyle(fontSize: 20,color: Colors.orange),),
            Text('रजिस्टर नंबर. E3678', style: TextStyle(fontSize: 20,color: Colors.orange,),),
            Text('दत्त भक्त खंबाजी पाटील', style: TextStyle(fontSize: 25,color: Colors.red, fontWeight: FontWeight.bold),),
            Text('९३०९२७३६१९', style: TextStyle(fontSize: 25,color: Colors.red, fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
