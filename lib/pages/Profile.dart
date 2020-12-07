import 'package:bookopedia/services/fauth.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool isLoading1 = false;

  @override
  Widget build(BuildContext context) {
    return isLoading1 ? Loading() : Scaffold(
      backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
          elevation: 2.0,
          tooltip: 'Logout',
          onPressed: () async {
            isLoading1 = true;
            await _auth.signOut();
          },
        ),
      body: Column(
        children: <Widget>[
        SizedBox(height: 30.0,),
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/pic.jpg'),
        radius: 50.0,
      ),
      SizedBox(height: 10.0,),
      Text(
        'Akhil Krishnan',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8,
        ),
      ),
      SizedBox(height: 10.0,),
      Center(
        child: Text('R5, Computer Science & Engineering',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
      SizedBox(height: 30.0,),
      ]
      )
    );
  }
}