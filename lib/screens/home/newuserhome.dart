import 'package:flutter/material.dart';



class Authenticate extends StatefulWidget {
  static const String id = 'newuserhome';
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Welcome to library_manager'),
        centerTitle: true,
      ),
      body:  Stack(fit: StackFit.expand,
        children: [Image(image: AssetImage('assets/lib_bg.png'),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[(SizedBox(
              height: 0.0,
              width: 200.0
        )),
    Center(
        child: SizedBox(
          width: 200.0,
          child: ElevatedButton(style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),)
          )),
            onPressed: () {
            Navigator.pushNamed(context, 'log_in');
          },
          child: Text('Log In'),
          ),
        ),
    ),
    SizedBox(
        height: 100.0,
        width: 200.0,
    ),
    SizedBox(
        width: 200.0,
        child: ElevatedButton(style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),)
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade400)),
          onPressed: () {
            Navigator.pushNamed(context, 'Register');
          },
          child: Text('Sign Up'),
        ),
    ),
           SizedBox(
             height: 100.0,
             width: 200.0,
           ),
           SizedBox(
             width: 200.0,
             child: ElevatedButton(style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(18.0),)
                 ),
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900)),
               onPressed: () {
                 Navigator.pushNamed(context, 'lib_log_in');
               },
               child: Text('Admin Log In'),
             ),
           ),

    ]),
      ]
      ));
  }
}
