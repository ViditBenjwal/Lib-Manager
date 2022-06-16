import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_manager/screens/update/LibrarianAdd.dart';

final _firestore = FirebaseFirestore.instance;

class libDel extends StatefulWidget {
  static const String id = 'LibrarianDel';
  const libDel({Key? key}) : super(key: key);
  @override
  State<libDel> createState() => _libDelState();
}

class _libDelState extends State<libDel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            elevation: 0.0,
            title: Text('Delete Book From Database'),
            centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('Books').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              List<listBG> bookList = [];
              if(snapshot.hasData) {
                final books = snapshot.data;
                if (books != null)
                {for (var book in books.docs) {
                  final bookID = book.data()['Book ID'];
                  final booktitle = book.data()!['Book Title'];
                  final bookauthor = book.data()!['Book Author'];
                  final Status = book.data()!['Status'];

                  bookList.add(
                      listBG(
                        title: booktitle,
                        ID: bookID,
                        author: bookauthor,
                        status: Status,)
                  );
                }

                }

              }
              return ListView(children: bookList);
            }
        )
    );

  }
}


class listBG extends StatefulWidget {
  String title = '';
  String author = '';
  String ID = '';
  String status = '';


  listBG(
      {
        required this.title,
        required this.author,
        required this.ID,
        required this.status
      }
      );



  @override
  State<listBG> createState() => _listBGState();
}

class _listBGState extends State<listBG> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${widget.ID}'),
          Text('${widget.title}'),
          Text('${widget.author}'),
          ElevatedButton(style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),)
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent.shade400)
          ),
            onPressed: () {
            final docID = _firestore.collection('Books').doc('${widget.ID}');
            docID.delete();
            Navigator.pop(context);
            }
              ,
            child: Text('Delete'),

          ),
        ],
      ),
    );
  }
}