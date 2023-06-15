import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class bank extends StatefulWidget {
  const bank({Key? key}) : super(key: key);

  @override
  State<bank> createState() => _bankState();
}

class _bankState extends State<bank> {
  final String youtubeVideoId = 'VAUuYRxFFS0'; // Replace with the YouTube video ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black, // Add the desired padding color
          ),
          child: Text(
            'How to Open a Bank Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent, // Replace with your desired title color
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.youtube.com/watch?v=$youtubeVideoId',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

