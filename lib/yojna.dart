import 'package:flutter/material.dart';

class yojna extends StatelessWidget {
  const yojna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login3'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'awaas');
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
                            'assets/awas2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Bank',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'swachabharat');
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
                    child: Image.asset(
                      'assets/swacha2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                   onTap: () {
              Navigator.pushNamed(context, 'ujwala');
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
                    child: Image.asset(
                      'assets/ujwalayojna2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
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
                    child: Image.asset(
                      'assets/exit2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

