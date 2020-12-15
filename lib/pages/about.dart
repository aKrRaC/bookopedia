import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About extends StatelessWidget {

  Widget _title1() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Ab',
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
              text: 'ut',
              style: TextStyle(color: Colors.blue[600], fontSize: 23),
            ),
          ]),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: _title1(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0,2.0,20.0,0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon.png'),
                    radius: 45.0,
                  ),
                ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _title(),
                ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text('where you find books!',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
            ),
              ],
            ),
              ],
            ),
            SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              child: Text('DEVELOPER',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text(
                'aKrRaC',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}