import 'package:flutter/material.dart';


//import 'package:video_player/video_player.dart';
//import 'package:wakelock/wakelock.dart';

class DipdanScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return SizedBox();
  }
}


// class DipdanScreen extends StatefulWidget {
//   const DipdanScreen({super.key});
//
//   @override
//   State<DipdanScreen> createState() => _DipdanScreenState();
// }

// class _DipdanScreenState extends State<DipdanScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState(){
//     super.initState();
//     _controller  = VideoPlayerController.asset('asset/vedio/dipdaanVedio.mp4');
//     _initializeVideoPlayerFuture = _controller.initialize();
//     Wakelock.enable();
//   }
//   @override
//   void dispose(){
//     _controller.dispose();
//     Wakelock.disable();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("दीपदान",style: TextStyle(color: Colors.white,fontSize: 18),),
//       centerTitle: true,),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//               child: InteractiveViewer(
//                   panEnabled: true,
//                   minScale: 0.5,
//                   maxScale: 4.0,
//                 child: const Image(image: AssetImage("asset/images/dipdan.jpeg"),)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: FutureBuilder(
//                 future: _initializeVideoPlayerFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     );
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SizedBox(
//                 height: 45,
//                 width: MediaQuery.of(context).size.width,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                   onPressed: () {
//                     setState(() {
//                       if (_controller.value.isPlaying) {
//                         _controller.pause();
//                         Wakelock.disable();
//                       } else {
//                         _controller.play();
//                         Wakelock.enable();
//                       }
//                     });
//                   },
//                 // child: ElevatedButton(onPressed: () {
//                 //   setState(() {
//                 //     _controller.value.isPlaying
//                 //         ? _controller.pause()
//                 //         : _controller.play();
//                 //   });
//                 // },
//                 child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow
//                 ),
//                             ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
