import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/dattaguru_arati.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/devi_arati.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/ganpati_arati.dart';
import 'package:datta_devsthan_pimpalgaon/drawerScreen/aratiScreen/prathana.dart';
import 'package:flutter/material.dart';

class AratiScreen extends StatefulWidget {
  const AratiScreen({super.key});

  @override
  State<AratiScreen> createState() => _AratiScreenState();
}

class _AratiScreenState extends State<AratiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("आरती संग्रह",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(height: 80,
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
                            builder: (context) => GanpatiArati(
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "श्री गणपतीची आरती",
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeviArati(
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "श्री देवीची आरती",
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DattaguruArati(
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "श्री दत्तात्रेयांची आरती",
                        style: TextStyle(
                          color: Colors.orange, // Set the text color
                          fontSize: 18,
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrathanaScreen(
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "प्रार्थना",
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
