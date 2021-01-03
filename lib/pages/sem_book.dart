import 'package:bookopedia/pages/sembook_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/book.dart';
import 'package:bookopedia/services/database.dart';

class SemBook extends StatefulWidget {
  @override
  _SemBookState createState() => _SemBookState();
}

class _SemBookState extends State<SemBook> {

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 23),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    String sem = ModalRoute.of(context).settings.arguments;
    return StreamProvider<List<BookData>>.value(
      value: DatabaseService().books,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: <Widget>[
            Container(
                padding: EdgeInsets.all(13),
                width: 58,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic.png'),
                  ),
                  onTap: (){

                  },
                )
            ),
          ],
          title: _title(),
          backgroundColor: Colors.grey[900],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: SemBookList(semnm: sem,),
        ),
      ),
    );
  }
}
