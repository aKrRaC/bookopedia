import 'package:bookopedia/pages/Searchpage.dart';
import 'package:bookopedia/pages/sem_book.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    Future navigateToSubPage(context) async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BookSearch()));
    }

    void _pressed(butname) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SemBook(),
          settings: RouteSettings(
            arguments: butname,
          ),
        ),
      );
    }

    Widget button(String butname) {
      return new GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                width: 175,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue[800],
                    image: DecorationImage(
                        image:AssetImage("assets/images/button.png"),
                        fit:BoxFit.cover
                    ),
                )
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Text(butname,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
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
              padding: EdgeInsets.fromLTRB(15, 25, 15, 20),
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16,10,0,0),
                child: Text("Books filtered based on semester: ",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6, 20, 6, 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        button("S1"),
                        button("S2"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        button("S3"),
                        button("S4"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        button("S5"),
                        button("S6"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

