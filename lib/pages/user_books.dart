import 'package:bookopedia/models/book.dart';
import 'package:bookopedia/pages/userbook_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/services/database.dart';

class UserBooks extends StatefulWidget {
  @override
  _UserBooksState createState() => _UserBooksState();
}

class _UserBooksState extends State<UserBooks> {

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'My ',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'Books',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          child: UserBookList(),
        ),
      ),
    );
  }
}
