import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({super.key});

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YouTube",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: WebviewScaffold(
        url: "https://www.youtube.com/@ShriGurudevDattaDhamTrust",
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
