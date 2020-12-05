import 'package:bookopedia/pages/Home.dart';
import 'package:bookopedia/pages/initpage.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user != null){
      return Home();
    }
    else{
      return WelcomePage();
    }
  }
}

