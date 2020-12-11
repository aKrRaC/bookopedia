import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/services/fauth.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool isLoading1 = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return isLoading1 ? Loading() : StreamBuilder(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Scaffold(
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
              body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0,),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic.jpg'),
                        radius: 50.0,
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        userData.name,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: userData.sem,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white
                              ),
                              children: [
                                TextSpan(
                                  text: ' | ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                                TextSpan(
                                  text: userData.dept,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                    ]
                ),
              )
          );
        }else{
          return Loading();
        }
      });
  }
}