import 'package:bookopedia/Chat.dart';
import 'package:bookopedia/HomePage.dart';
import 'package:bookopedia/Profile.dart';
import 'package:bookopedia/Search.dart';
import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  theme: new ThemeData(
    canvasColor: Colors.grey[900],
  )
));


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedPage = 0;

  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    Search(),
    Chat(),
    Profile()
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            width: 58,
            child: GestureDetector(
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pic.jpg'),
                  ),
              onTap: (){Profile();},
            )
            ),
        ],
        title: Text(
          'Bookopedia',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ], //items end
        currentIndex: selectedPage,
        onTap: (index){
          setState(() {
            selectedPage = index;});
          }
      ),
      body: _pageOptions.elementAt(selectedPage),
    );
  }
}
