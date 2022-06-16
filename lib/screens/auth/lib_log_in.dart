import 'package:flutter/material.dart';

class LibLogIn extends StatefulWidget {
  static const String id = 'lib_log_in';
  const LibLogIn({Key? key}) : super(key: key);

  @override
  State<LibLogIn> createState() => _LibLogInState();
}

class _LibLogInState extends State<LibLogIn> {
  String libemail = '';
  String libpassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.brown.shade700,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Librarian Log In for library_manager'),
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
    libemail = value;
    },
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    labelText: "Admin Username"),
    ),),
    ),
    SizedBox(
    height: 25.0,
    ),
    SizedBox(
    width: 400.0,
    child: TextFormField(onChanged: (value) {
    libpassword = value;
    },
    obscureText: true,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    labelText: "Admin Password"
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

    onPressed: () {
      if (libemail == 'SUTT_admin' && libpassword == '1234567890') {
        Navigator.pushNamed(context, 'Librarianhome');
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
    content: Text("Invalid Login Credentials"),
    ),);
    }
      } ,
    child: Text("Log In")),


    ])
    );
  }
}
