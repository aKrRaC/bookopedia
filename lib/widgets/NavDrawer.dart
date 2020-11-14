import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {

  @override

  _launchURL() async {
    const url = 'https://github.com/aKrRaC/Bookopedia.git';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Bookopedia',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/cover.jpg')
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
            onTap: () => {Navigator.of(context).pop()},
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
              _launchURL(),
              Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}