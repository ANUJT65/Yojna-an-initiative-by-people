import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'),fit:BoxFit.cover )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35,top: 190),
              child: Text('WELCOME\n BACK',style: TextStyle(
                  color:Colors.redAccent,
                  fontSize: 40
              ),
              ),

            ),
            SingleChildScrollView(
              child: Container(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,right: 40,
                  left:40
              ),
                child:Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.redAccent,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.orangeAccent,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                        height:35
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign In',style: TextStyle(
                            color:Color(0xff4c505b),
                            fontSize: 35,
                            fontWeight:FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color:Colors.deepOrangeAccent,
                            onPressed: ()
                            {
                              Navigator.pushNamed(context,'home');
                            },

                            icon:Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        height:10
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context,'register');
                        }, child: Text('Sign Up',style: TextStyle(
                            decoration:TextDecoration.underline,
                            fontSize: 28,
                            color:Color(0xff4c505b)),
                        )),

                        TextButton(onPressed: (){}, child: Text('Forgot Password',style: TextStyle(
                            decoration:TextDecoration.underline,
                            fontSize: 18,
                            color:Color(0xff4c505b)),)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }
}
