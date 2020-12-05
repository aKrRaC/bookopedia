import 'package:bookopedia/widgets/bezierContainer.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/authentication/Login.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 40),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .35),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pic.jpg'),
                      radius: 50.0,
                    ),
                    SizedBox(height: 5.0,),
                    Center(child: _title()),
                    SizedBox(height: 4.0,),
                    Text('where you find books!',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_forward),
          label: Text('Let\'s Go'),
          elevation: 5.0,
          tooltip: 'Let\'s Go',
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }
}
