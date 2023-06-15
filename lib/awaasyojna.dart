import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class awaas extends StatefulWidget {
  const awaas({Key? key}) : super(key: key);

  @override
  State<awaas> createState() => _awaasState();
}

class _awaasState extends State<awaas> {
  late WebViewController _webViewController;
  final String youtubeVideoUrl = 'https://www.youtube.com/watch?v=aMaCGXbEfsU&list=LL&index=5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awaas Yojna', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: WebView(
          initialUrl: youtubeVideoUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
