import 'package:bookopedia/services/fauth.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/widgets/bezierContainer.dart';
import 'package:bookopedia/authentication/Login.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String email = '';
  String password = '';
  String dept = '';
  String sem = '';
  String name = '';
  String number = '';
  String admnum = '';
  String error = '';
  int credit = 0;
  int numbook = 0;
  bool isLoading1 = false;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Back',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
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
            height: 8,
          ),
          TextFormField(
              style: TextStyle(color: Colors.white),
              validator: (val) => val.isEmpty ? 'Fill in all the details!' : null,
              onChanged: (val) {
                if (title == "Email id"){
                  setState(() => email = val);
                }
                else if (title == 'Password (atleast 6 characters long)'){
                  setState(() => password = val);
                }
                else if (title == 'Username'){
                  setState(() => name = val);
                }
                else if (title == 'Admission number'){
                  setState(() => admnum = val);
                }
                else if (title == 'Department (eg. CS)'){
                  setState(() => dept = val);
                }
                else if (title == 'Semester (eg. S5)'){
                  setState(() => sem = val);
                }
                else if (title == 'Phone no.'){
                  setState(() => number = val);
                }
              },
              obscureText: isPassword,
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


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Colors.white),
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username",),
        _entryField("Email id"),
        _entryField("Password (atleast 6 characters long)", isPassword: true),
        _entryField("Admission number"),
        _entryField("Department (eg. CS)"),
        _entryField("Semester (eg. S5)"),
        _entryField("Phone no."),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return isLoading1 ? Loading() : Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child:_emailPasswordWidget(),
                    ),
                    _loginAccountLabel(),
                    Text(error,
                    style: TextStyle(
                      color: Colors.red
                    )),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          backgroundColor: Colors.blue[600],
          label: Text('Create Account'),
          elevation: 5.0,
          tooltip: 'Create Account',
          onPressed: () async {
            if (_formKey.currentState.validate()){
              setState(() => isLoading1 = true);
              dynamic result = await _auth.regEmail(email, password, name, admnum, dept, sem, credit, numbook, number);
              if (result == null){
                setState(() {
                  isLoading1 = false;
                  error = 'Account creation unsuccessful, please enter valid details!';
                });
              }
              else{
                Navigator.pop(context);
                Navigator.pop(context);
              }
            }
          },
        ),
      ),
    );
  }
}