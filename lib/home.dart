import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AudioPlayer _audioPlayer;
  final String audioUrl = 'https://example.com/audio.mp3'; // Replace with your audio file URL

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(audioUrl, isLocal: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/register.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'bank');
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.brown,
                            width: 4,
                          ),
                        ),
                        child: Image.asset(
                          'assets/bank.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 160.0),
                        child: Text(
                          'Bank',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'adhar');
                },
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.brown,
                      width: 4,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/adhar.jpg',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Adhar',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'yojna');
                },
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.brown,
                      width: 4,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/schemes4.png',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Schemes',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'forum');
                },
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.brown,
                      width: 4,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/janta.png',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Aapke savaal',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}