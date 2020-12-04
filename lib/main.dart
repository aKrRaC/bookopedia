import 'package:bookopedia/authentication/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Bookopedia());

class Bookopedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
        canvasColor: Colors.grey[900],
        ),
        home: Wrapper(),
    );
  }
}

