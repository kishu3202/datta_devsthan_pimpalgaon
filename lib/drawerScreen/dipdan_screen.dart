import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DipdanScreen extends StatefulWidget {
  const DipdanScreen({super.key});

  @override
  State<DipdanScreen> createState() => _DipdanScreenState();
}

class _DipdanScreenState extends State<DipdanScreen> {
  late VideoPlayerController _controller;

  @override
  void initState(){
    super.initState();
    _controller  = VideoPlayerController.asset('asset/vedio/dipdaanVedio.mp4');
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("दीपदान",style: TextStyle(color: Colors.white,fontSize: 18),),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image(image: AssetImage("asset/images/dipdan.jpeg"),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: _controller.value.isInitialized ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
                )
                    : Container(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
