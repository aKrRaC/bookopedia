import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/models/user.dart';

class AddBooks extends StatefulWidget {

  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {

  String bookname = "";
  String author = "";
  String edition = "";
  String bdept = "";
  String bsem = "";
  String error = "";
  String userid = "";
  int credit = 0;
  int numbook = 0;
  final _formKey1 = GlobalKey<FormState>();
  bool isLoading2 = false;
  Future getCurrentUser() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    setState(() {
      userid = uid.toString();
    });
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Add B',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'oo',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            TextSpan(
              text: 'ks',
              style: TextStyle(color: Colors.blue[600], fontSize: 23),
            ),
          ]),
    );
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
            style: TextStyle(color: Colors.white),
              validator: (val) => val.isEmpty ? 'Fill in all the details!' : null,
              onChanged: (val) {
                if (title == "Book name"){
                  setState(() => bookname = val);
                }
                else if (title == 'Author'){
                  setState(() => author = val);
                }
                else if (title == 'Edition (eg. 2nd Edition)'){
                  setState(() => edition = val);
                }
                else if (title == 'Department (eg. CS)'){
                  setState(() => bdept = val);
                }
                else if (title == 'Semester (eg. S5)'){
                  setState(() => bsem = val);
                }
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true))
        ],
      ),
    );
  }

  Widget _fieldwidget() {
    return Column(
      children: <Widget>[
        _entryField("Book name",),
        _entryField("Author"),
        _entryField("Edition (eg. 2nd Edition)"),
        _entryField("Department (eg. CS)"),
        _entryField("Semester (eg. S5)"),
      ],
    );
  }

  @override

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final height = MediaQuery.of(context).size.height;
    return isLoading2 ? Loading() : StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.all(13),
                    width: 58,
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic.png'),
                      ),
                      onTap: () {

                      },
                    )
                ),
              ],
              title: _title(),
              backgroundColor: Colors.grey[900],
            ),
            body: Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                              key: _formKey1,
                              child: _fieldwidget()
                          ),
                          Text(error,
                              style: TextStyle(
                                  color: Colors.red
                              )),
                          SizedBox(height: 100,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.add),
              backgroundColor: Colors.blue[600],
              label: Text('Add'),
              elevation: 2.0,
              tooltip: 'Add books',
              onPressed: () {
                if (_formKey1.currentState.validate()) {
                  print(userid);
                  setState(() {
                    isLoading2 = true;
                  });
                  dynamic result = Firestore.instance.collection("book_data").document()
                      .setData({
                    'userid': userData.admnum,
                    'bookname': bookname,
                    'author': author,
                    'edition': edition,
                    'department': bdept,
                    'semester': bsem,
                  });
                  dynamic result1 = Firestore.instance.collection("user_data").document(userData.uid)
                      .updateData({
                    'credit': FieldValue.increment(5),
                    'book #': FieldValue.increment(1),
                  });
                  print(credit);
                  print(numbook);
                  if (result == null || result1 == null) {
                    setState(() {
                      isLoading2 = false;
                      error = 'Book insertion unsuccessful, please try again!';
                    });
                  }
                  else {
                    Navigator.pop(context);
                  }
                }
              },
            ),
          );
        }
    );
  }
}