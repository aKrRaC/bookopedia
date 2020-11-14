import 'package:bookopedia/widgets/BottomBar.dart';
import 'package:bookopedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  theme: new ThemeData(
  canvasColor: Colors.grey[900]
  )
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  _launchURL() async {
    const url = 'https://github.com/aKrRaC/Bookopedia.git';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void handleClk(String value) {
    switch (value) {
      case 'Source code':
        _launchURL();
        break;
      case 'About':
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Bookopedia',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClk,
            itemBuilder: (BuildContext context) {
              return {'Source code','About'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      bottomNavigationBar: BottomBar()
    );
  }
}
