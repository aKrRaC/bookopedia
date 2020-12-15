import 'package:bookopedia/pages/Add_Books.dart';
import 'package:bookopedia/pages/bookdesc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bookopedia/widgets/bezierContainer.dart';

class HomePage extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Bookdesc()));
  }

  /*Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Welc',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            TextSpan(
              text: 'me',
              style: TextStyle(color: Colors.blue[600], fontSize: 32),
            ),
          ]),
    );
  }*/

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
                child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        BezierContainer(),
                    ]
                  )
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add Books'),
        elevation: 2.0,
        tooltip: 'Add books',
        onPressed: (){
          navigateToSubPage(context);
        },
      ),
    );
  }
}