import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class swachabharat extends StatefulWidget {
  const swachabharat({Key? key}) : super(key: key);

  @override
  State<swachabharat> createState() => _swachabharatState();
}

class _swachabharatState extends State<swachabharat> {
  late WebViewController _webViewController;
  final String youtubeVideoUrl = 'https://www.youtube.com/watch?v=Qg4w8TQkn3w&list=LL&index=3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swacha Bharat Yojna', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
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
