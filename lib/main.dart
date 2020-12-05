import 'package:bookopedia/authentication/wrapper.dart';
import 'package:bookopedia/services/fauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';

void main() => runApp(Bookopedia());

class Bookopedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          theme: new ThemeData(
          canvasColor: Colors.grey[900],
          ),
          home: Wrapper(),
      ),
    );
  }
}

