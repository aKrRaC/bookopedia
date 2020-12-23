import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Editpage extends StatefulWidget {
  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {

  String name1 = "";
  String phonenum = "";
  final _formKey = GlobalKey<FormState>();
  bool isLoading4 = false;
  String error = '';

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Edit ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'Details',
              style: TextStyle(color: Colors.white, fontSize: 30),
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
              validator: (val){
                if(title == "Phone no." && val.isNotEmpty && val.length != 10){
                  return "Please enter a valid phone number";
                }else{
                  return null;
                }
              },
              style: TextStyle(color: Colors.white),
              onChanged: (val) {
                if (title == "Name"){
                  setState(() => name1 = val);
                }
                else if (title == 'Phone no.'){
                  setState(() => phonenum = val);
                }
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  fillColor: Colors.grey[900],
                  filled: true))
        ],
      ),
    );
  }

  Widget _field() {
    return Column(
      children: <Widget>[
        _entryField("Name",),
        _entryField("Phone no."),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return isLoading4 ? Loading() : StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
        UserData userData = snapshot.data;
        return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 125,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: _title()
                  ),
                  SizedBox(height: 50,),
                  _field(),
                  SizedBox(height: 10,),
                  Text(" v Swipe down to dismiss v ",
                    style: TextStyle(
                    color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(error,
                      style: TextStyle(
                          color: Colors.red
                      )),
                  SizedBox(height: 100,),
              ]),
            ),
            )
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.update),
            backgroundColor: Colors.blue[600],
            label: Text('Update details'),
            elevation: 2.0,
            tooltip: 'Update details',
            onPressed: () {
              if (_formKey.currentState.validate()){
                setState(() {
                  isLoading4 = true;
                });
                if(name1.isNotEmpty && phonenum.isNotEmpty){
                  dynamic result2 = Firestore.instance.collection("user_data").document(userData.uid)
                      .updateData({
                    'name': name1,
                    'phone #': phonenum,
                  });
                  if(result2 == null){
                    setState(() {
                      isLoading4 = false;
                      error = 'Updating details unsuccessful, please try again!';
                    });
                  }else{
                    Navigator.of(context).pop();
                  }
                }else if(name1.isNotEmpty){
                  dynamic result2 = Firestore.instance.collection("user_data").document(userData.uid)
                      .updateData({
                    'name': name1,
                  });
                  if(result2 == null){
                    setState(() {
                      isLoading4 = false;
                      error = 'Updating details unsuccessful, please try again!';
                    });
                  }else{
                    Navigator.of(context).pop();
                  }
                }else if(phonenum.isNotEmpty){
                  dynamic result2 = Firestore.instance.collection("user_data").document(userData.uid)
                      .updateData({
                    'phone #': phonenum,
                  });
                  if(result2 == null){
                    setState(() {
                      isLoading4 = false;
                      error = 'Updating details unsuccessful, please try again!';
                    });
                  }else{
                    Navigator.of(context).pop();
                  }
                }
              }
            },
          ),
        );
      }
    );
  }
}
