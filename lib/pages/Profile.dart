import 'package:bookopedia/services/fauth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.logout),
          label: Text('LogOut'),
          elevation: 2.0,
          tooltip: 'Add books',
          onPressed: () async {
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