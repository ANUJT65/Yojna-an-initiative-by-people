import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Adhar extends StatefulWidget {
  const Adhar({Key? key}) : super(key: key);

  @override
  State<Adhar> createState() => _AdharState();
}

class _AdharState extends State<Adhar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adhar',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 40,
          ),
        ),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Offline Aadhaar'),

            Tab(text: 'Online Aadhaar'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildOnlineAadhaarSection(),
          buildOfflineAadhaarSection(),
        ],
      ),
    );
  }

  Widget buildOnlineAadhaarSection() {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://www.youtube.com/watch?v=YFn6YSpsF7ID',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Widget buildOfflineAadhaarSection() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Online Aadhaar Section',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Open the video link for offline Aadhaar
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnlineAadhaarVideoPage(),
                ),
              );
            },
            child: Text('Open Video Link'),
          ),
        ],
      ),
    );
  }
}

class OnlineAadhaarVideoPage extends StatelessWidget {
  final String videoUrl = 'https://www.youtube.com/watch?v=BqXq-oYRAP8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Aadhaar Video'),
      ),
      body: WebView(
        initialUrl: videoUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
