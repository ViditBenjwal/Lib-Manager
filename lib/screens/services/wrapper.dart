import 'package:flutter/material.dart';
import 'package:library_manager/screens/home/newuserhome.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}



