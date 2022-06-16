import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Sign Up for library_manager'),
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
                      labelText: "Create Username(Enter email)"),
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
                    labelText: "Create Password(Minimum 6 characters)"
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
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null)
                {Navigator.pushNamed(context, 'log_in');}
              }
                catch (e) {
                print (e);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid Credentials"),
                    ),);
                }
              },

                child: Text("Sign Up")),

          ] ),
    );
  }
}
