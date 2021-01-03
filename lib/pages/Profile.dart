import 'package:bookopedia/pages/editpage.dart';
import 'package:bookopedia/pages/user_books.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/services/fauth.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool isLoading1 = false;
  final _formKey = GlobalKey<FormState>();

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UserBooks()));
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    final width = MediaQuery.of(context).size.width;

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

    Widget _entryField(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                validator: (val){
                  if(title == "" && val.isEmpty){
                    return "Type 'I confirm to delete' inorder to continue";
                  }else if(title == "" && val.isNotEmpty && val != "I confirm to delete"){
                    return "Type 'I confirm to delete' inorder to continue";
                  }else{
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type 'I confirm to delete' to continue",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Colors.black,
                    filled: true))
          ],
        ),
      );
    }

    Widget _field() {
      return Column(
        children: <Widget>[
          _entryField("",),
        ],
      );
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

    void _showWarning() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          context: context,
          isScrollControlled: true,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Image(image: AssetImage("assets/images/caution.png")),
                  SizedBox(height: 30,),
                  Text('By continuing you are confirming to delete your account and the books you have added! Do you want to continue ?',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: _field()
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      icon: Icon(Icons.delete),
                      backgroundColor: Colors.red,
                      label: Text('Confirm & Delete'),
                      elevation: 5.0,
                      tooltip: 'Delete account',
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          isLoading1 = true;
                          Navigator.of(context).pop();
                          dynamic res = Firestore.instance.collection(
                              'book_data').getDocuments().then((snapshot) {
                            List<DocumentSnapshot> allDocs = snapshot.documents;
                            List<DocumentSnapshot> filteredDocs = allDocs.where(
                                    (document) =>
                                document.data['userid'] == user.uid
                            ).toList();
                            for (DocumentSnapshot ds in filteredDocs) {
                              ds.reference.delete();
                            }
                          });
                          dynamic res1 = Firestore.instance.collection(
                              "user_data").document(user.uid).delete();
                          if (res != null && res1 != null) {
                            FirebaseUser user1 = await FirebaseAuth.instance
                                .currentUser();
                            user1.delete();
                          }
                        }
                      }
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            );
          });
    }

    void pressed(butname) {
      if (butname == "Books added by me") {
        navigateToSubPage(context);
      }
      if (butname == "Delete account      \t\t") {
        _showWarning();
      }
    }

    Widget button(String butname) {
       return new Padding(
        padding: const EdgeInsets.fromLTRB(16.0,0,0,0),
        child: ButtonTheme(
          height: 60,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              splashColor: Colors.blue[600],
              onPressed: () {
                pressed(butname);
              },
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      butname,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  SizedBox(width: width-232,),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                    size: 15.0,
                  )
                ],
              )),
        ),
      );
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
                                    color: Colors.blue[800],
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
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                      button("Books added by me"),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32,5,0,5),
                          child: Text("Dangerous",
                            style: TextStyle(color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),),
                        ),
                      ),
                      button("Delete account      \t\t"),
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