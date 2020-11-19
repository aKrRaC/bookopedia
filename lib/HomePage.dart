import 'package:bookopedia/Add_Books.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Books()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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