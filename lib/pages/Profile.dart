import 'package:bookopedia/pages/editpage.dart';
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

    void _showLogout() {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        context: context,
        builder: (context){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text('Do you really want to stop finding books and logout ?',
               style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w400,
                 fontSize: 16
               ),
             ),
             SizedBox(height: 40,),
             Align(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton.extended(
                 icon: Icon(Icons.check),
                 backgroundColor: Colors.blue[600],
                 label: Text('Yep! Let me out'),
                 elevation: 5.0,
                 tooltip: 'Logout',
                 onPressed: () async {
                   isLoading1 = true;
                   Navigator.of(context).pop();
                   await _auth.signOut();
                 },
               ),
             ),
           ],
         ),
       );
      },);
    }

    void _showEdit() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          context: context,
          isScrollControlled: true,
          builder: (context){
        return Editpage();
      });
    }

    return isLoading1 ? Loading() : StreamBuilder(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Scaffold(
              backgroundColor: Colors.black,
              floatingActionButton: FloatingActionButton.extended(
                icon: Icon(Icons.logout),
                backgroundColor: Colors.blue[600],
                label: Text('Logout'),
                elevation: 2.0,
                tooltip: 'Logout',
                onPressed: () {
                  _showLogout();
                },
              ),
              body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      Container(
                          child: Container(
                            width: double.infinity,
                            height: 350.0,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      "assets/images/pic.png",
                                    ),
                                    radius: 50.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 40,),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          userData.name,
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      IconButton(icon: Icon(Icons.edit,
                                      color: Colors.grey,),
                                          onPressed: () {
                                            _showEdit();
                                          })
                                    ],
                                  ),
                                  SizedBox(height: 5.0,),
                                  Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: userData.sem,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' | ',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 14),
                                            ),
                                            TextSpan(
                                              text: "${userData.dept} | ${userData.number}",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 14),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 26.0,vertical: 8.0),
                                    clipBehavior: Clip.antiAlias,
                                    color: Colors.blue[600],
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(width: 10.0,),
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  "Books Added",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  userData.numbook.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white70,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  "Credits",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  userData.credit.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white70,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
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