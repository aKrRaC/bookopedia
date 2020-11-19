import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class Add_Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Add Books',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
          ),
        ) ,
      ),
    );
  }
}