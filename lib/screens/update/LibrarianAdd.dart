import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class libAdd extends StatefulWidget {
  static const String id = 'LibrarianAdd';
  const libAdd({Key? key}) : super(key: key);

  @override
  State<libAdd> createState() => _libAddState();
}

class _libAddState extends State<libAdd> {
  final _firestore = FirebaseFirestore.instance;
  String BookTitle = '';
  String BookAuthor = '';
  String BookID = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Add New Book'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100.0,
          ),
          TextFormField(onChanged: (value) {
          BookTitle = value;
          },
           textAlign: TextAlign.center,
            decoration: InputDecoration(
            hintText: "Enter Title of Book",
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrangeAccent.shade400),
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          TextFormField(onChanged: (value) {
            BookAuthor = value;
          },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter Author of Book",
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrangeAccent.shade400),
                ),
              ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ElevatedButton(style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),)
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent.shade400)
    ),
            onPressed: () async {
               final docdata = _firestore.collection('Books').doc();
               final map =
              {'Book Title': BookTitle,
              'Book Author': BookAuthor,
              'Status': 'Not Issued',
              'Book ID': docdata.id,
              };
              await docdata.set(map);
              Navigator.pushNamed(context, 'Librarianhome');
              },
            child: Text('Add New Book to Library'),
          ),
        ],

      )
    );
  }
}
