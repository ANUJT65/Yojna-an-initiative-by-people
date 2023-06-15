import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ujwalayojna extends StatefulWidget {
  const ujwalayojna({Key? key}) : super(key: key);

  @override
  State<ujwalayojna> createState() => _ujwalayojnaState();
}

class _ujwalayojnaState extends State<ujwalayojna> {
  late WebViewController _webViewController;
  final String youtubeVideoUrl = 'https://www.youtube.com/watch?v=q9RlhLDB2PI&list=LL&index=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ujwala Yojna', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
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
