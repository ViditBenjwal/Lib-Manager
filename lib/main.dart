import 'package:flutter/material.dart';
import 'package:library_manager/screens/auth/Register.dart';
import 'package:library_manager/screens/auth/lib_log_in.dart';
import 'package:library_manager/screens/home/Librarianhome.dart';
import 'package:library_manager/screens/home/newuserhome.dart';
import 'package:library_manager/screens/home/Studenthome.dart';
import 'package:library_manager/screens/services/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:library_manager/screens/auth/log_in.dart';
import 'package:library_manager/screens/update/LibrarianAdd.dart';
import 'package:library_manager/screens/update/LibrarianDel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      initialRoute: Wrapper.id,
      routes: {'Studenthome': (context) => Homescreen(),
        'wrapper': (context) => Wrapper(),
        'newuserhome': (context) => Authenticate(),
        'log_in': (context) => SignIn(),
        'Register': (context) => Register(),
        'lib_log_in' : (context) => LibLogIn(),
        'Librarianhome' : (context) => LibHomescreen(),
        'LibrarianAdd' : (context)=> libAdd(),
        'LibrarianDel' : (context) => libDel(),

      }
    );
  }
}


