//import 'package:bookopedia/pages/chathome.dart';
import 'package:bookopedia/pages/HomePage.dart';
import 'package:bookopedia/pages/Profile.dart';
import 'package:bookopedia/pages/Search.dart';
import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedPage = 0;

  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    Search(),
    //Chat(),
    Profile()
  ];

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 23),
            ),
          ]),
    );
  }

  @override

  Widget build(BuildContext context) {
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
                  backgroundImage: AssetImage('assets/images/pic.png'),
                ),
                onTap: (){
                  setState(() => selectedPage = 3);
                },
              )
          ),
        ],
        title: _title(),
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: 'Search',
            ),
            /*BottomNavigationBarItem(
              icon: new Icon(Icons.chat),
              label: 'Chat',
            ),*/
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
