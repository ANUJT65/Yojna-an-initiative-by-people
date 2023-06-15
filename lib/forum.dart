import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List<String> queries = [];
  List<String> images = [];
  TextEditingController _textEditingController = TextEditingController();
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _initializeSpeechToText();
  }

  void _initializeSpeechToText() async {
    bool available = await _speechToText.initialize();
    if (available) {
      _speechToText.errorListener = (error) => print('Error: $error');
    } else {
      print('Speech recognition not available');
    }
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      queries = prefs.getStringList('queries') ?? [];
      images = prefs.getStringList('images') ?? [];
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('queries', queries);
    await prefs.setStringList('images', images);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _postQuery(String query, [String speechResult = '']) {
    setState(() {
      if (query.isNotEmpty || speechResult.isNotEmpty) {
        queries.add(query.isNotEmpty ? query : speechResult);
        images.add(''); // Empty string as a placeholder for image
        _saveData();
        _textEditingController.clear();
      }
    });
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speechToText.listen(
          onResult: (result) {
            setState(() {
              _textEditingController.text = result.recognizedWords;
            });
          },
        );
      } else {
        print('Speech recognition not available');
      }
    }
  }

  void _stopListening() {
    if (_isListening) {
      setState(() => _isListening = false);
      _speechToText.stop();
    }
  }

  void _uploadImage(int index) {
    // Implement image upload logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'AAPKE SAVAAL',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.transparent, // Set transparent background color
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'आपके सवाल परेशानी',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: queries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      queries[index],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        _uploadImage(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      minLines: 4,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'TYPE HERE TO ASK QUESTIONS ',



                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _postQuery(_textEditingController.text),
                  ),
                  IconButton(
                    icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                    onPressed: () {
                      if (_isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}