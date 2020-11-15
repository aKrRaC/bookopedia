import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'About',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
          ),
        ) ,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          CircleAvatar(
            backgroundImage: AssetImage('assets/ps.jpg'),
            radius: 50.0,
          ),
          SizedBox(height: 10.0,),
          Text(
            'Bookopedia',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8,
            ),
          ),
          SizedBox(height: 10.0,),
          Center(
            child: Text('where you find books!',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
          SizedBox(height: 30.0,),
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
    );
  }
}