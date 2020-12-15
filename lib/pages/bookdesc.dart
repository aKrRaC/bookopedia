import 'package:flutter/material.dart';

class Bookdesc extends StatefulWidget {
  @override
  _BookdescState createState() => _BookdescState();
}

class _BookdescState extends State<Bookdesc> {

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          Container(
              padding: EdgeInsets.all(13),
              width: 58,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pic.png'),
              )
          ),
        ],
        title: _title(),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
