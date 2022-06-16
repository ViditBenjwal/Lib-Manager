import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_manager/screens/services/google_SignIn_service.dart';


class SignIn extends StatefulWidget {
  static const String id = 'log_in';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Log In to library_manager'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[(SizedBox(
          height: 0.0,
      )),
      Center(
        child: SizedBox(
        width: 400.0,
        child: TextFormField(onChanged: (value) {
          email = value;
        },
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Username (Enter email)"),
        ),),
      ),
          SizedBox(
            height: 25.0,
          ),
      SizedBox(
        width: 400.0,
        child: TextFormField(onChanged: (value) {
            password = value;
           },
          obscureText: true,
          textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.white,
            filled: true,
            labelText: "Password(Minimum 6 characters)"
        ),
    ),),
         SizedBox(
           height: 50.0,
         ),
        ElevatedButton(style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),)
        )),

    onPressed: () async {
      try {
        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if (user != null)
          {
            Navigator.pushNamed(context, 'Studenthome');
          }
      }
      catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Login Credentials"),
          ),);
      }
    } ,
            child: Text("Log In")),
    SizedBox(
    height: 30.0,
    ),
        ElevatedButton(style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),)
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange.shade400)
        ),

          onPressed: () async {
            User? user =
            await Authentication.signInWithGoogle(context: context);
            if (user!= null) {
              Navigator.pushNamed(context, 'Studenthome');
            }
    },
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/google_logo.png', height: 25,),
          Text('   Sign In with Google'),
    ],
    ),
        )] ),
      );
  }
}
