import 'package:bookopedia/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class NavDrawer extends StatelessWidget {


  _launchURL() async {
    const url = 'https://github.com/aKrRaC/Bookopedia.git';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Book',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.blue[600],
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            TextSpan(
              text: 'pedia',
              style: TextStyle(color: Colors.blue[600], fontSize: 28),
            ),
          ]),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
  }

  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
                alignment: Alignment.topLeft,
                child: _title()),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg')
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.border_color,
                color: Colors.white),
            title: Text('Source code',
              style: TextStyle(
              color: Colors.white
              ),
            ),
            onTap: () => {
              _launchURL(),
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.info,
                color: Colors.white),
            title: Text(
                'About',
              style: TextStyle(
              color: Colors.white
              ),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              navigateToSubPage(context),
            },
          ),//About
        ],
      ),
    );
  }
}
