import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class AddBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Add Books',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
          ),
        ) ,
      ),
      body: Column(
        children: [
          SizedBox(height:20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,240,0),
            child: Text('Book name:',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: 'Enter book name...'
              ),
            ),
          ),
          SizedBox(height:5.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,270,0),
            child: Text('Author:',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: 'Enter author name...'
              ),
            ),
          ),
          SizedBox(height:5.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,235,0),
            child: Text('Department:',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: 'Enter department...'
              ),
            ),
          ),
          SizedBox(height:5.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,250,0),
            child: Text('Semester:',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: 'Enter semester...'
              ),
            ),
          ),
        ],
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