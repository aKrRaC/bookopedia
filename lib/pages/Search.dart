import 'package:bookopedia/pages/Searchpage.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Searchpage()));
  }
  @override

  Widget build(BuildContext context) {

    void _pressed(butname) {

    }

    Widget button(String butname) {
      return new GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                width: 175,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue[800],
                    image: DecorationImage(
                        image:AssetImage("assets/images/button.jpg"),
                        fit:BoxFit.cover
                    ),
                )
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Text(butname,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 26
                  ),
                ),
              )
            ]
          ),
          onTap:(){
            _pressed(butname);
        }
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: ButtonTheme(
                minWidth: 400,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.grey[900],
                  onPressed: () {
                    navigateToSubPage(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.search,
                    color: Colors.grey,),
                    SizedBox(width: 12.0,),
                    Text("Search",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),)
                  ],
                ),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        button("S1"),
                        button("S2"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        button("S3"),
                        button("S4"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        button("S5"),
                        button("S6"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        button("S7"),
                        button("S8"),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}

