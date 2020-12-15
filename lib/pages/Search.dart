import 'package:bookopedia/pages/Searchpage.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Searchpage()));
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
          ],
        ),
      ) ,
    );
  }
}

