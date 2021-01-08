import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

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

  Widget _greetings() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          text: 'Hey',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: ' there,\n',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: 'welcome to ',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'Book',
              style: TextStyle(color: Colors.blue[600], fontSize: 30),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 30),
            ),
            TextSpan(
              text: ', where (you guessed it :P) find books! A few points to note before starting:\n\n',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '.',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            TextSpan(
              text: '\t"Books you might like" in homescreen won\'t show up unless you add your first book.\n',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '.',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            TextSpan(
              text: '\tEach book you add increments the credit by 5.\n',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '.',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            TextSpan(
              text: '\tContacting a person either via phone/whatsapp requires credits.\n',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '.',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            TextSpan(
              text: '\tYou can check your credits along with the no. of books you have added on the profile page.\n',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '\nThat\'s all for now. We hope you enjoy using our app. Gracias!',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              Row(
                children: [
                  SizedBox(height: height*0.25,),
                  SizedBox(width: width*0.14,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,2.0,20.0,0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/icon.png'),
                      radius: 45.0,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: _title(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text('where you find books!',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: _greetings(),
              )
            ]
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_forward),
            backgroundColor: Colors.blue[600],
            label: Text('Let me in!'),
            elevation: 2.0,
            tooltip: 'Start',
          )
        );
    }
}
