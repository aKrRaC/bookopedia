import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class AddBooks extends StatelessWidget {

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
          TextField(
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
        _entryField("Department"),
        _entryField("Semester"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Container(
              padding: EdgeInsets.all(13),
              width: 58,
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pic.jpg'),
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
                    _fieldwidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add'),
        elevation: 2.0,
        tooltip: 'Add books',
        onPressed: (){

        },
      ),
    );
  }
}