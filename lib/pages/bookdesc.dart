import 'package:bookopedia/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bookdesc extends StatefulWidget {
  @override
  _BookdescState createState() => _BookdescState();
}

class _BookdescState extends State<Bookdesc> {

  bool isLoading5 = false;

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

  _launchURL(String phone) async {

    dynamic url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override

  Widget build(BuildContext context) {
    final BookData book1 = ModalRoute.of(context).settings.arguments;
    final height = MediaQuery.of(context).size.height;
    return isLoading5 ? Loading() : StreamBuilder(
        stream: Firestore.instance.collection('user_data').document(book1.userid).snapshots(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          var user2 = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.all(13),
                    width: 58,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pic.png'),
                    )
                ),
              ],
              title: _title(),
              backgroundColor: Colors.grey[900],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height * .04,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Center(
                        child: Container(
                            width: 130.0,
                            height: 175.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              color: Colors.blue[600],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage('assets/images/NotAvailable.jpg'),
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(book1.bookname,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(book1.author,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 2.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue[800],
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 24.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Book Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Department: ${book1.bdept}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Semester: ${book1.bsem}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Edition: ${book1.edition}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02,),
                                  Text(
                                    "Posted by",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${user2["name"]}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Department: ${user2["department"]}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Semester: ${user2["semester"]}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      SelectableText(
                                        'Contact: ${user2["phone #"]}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * .15,),
                  ],
                ),
              ),
            ),
            floatingActionButton: new Visibility(
              visible: (book1.userid != user2["userid"]),
              child: FloatingActionButton.extended(
                icon: Icon(Icons.quick_contacts_dialer),
                backgroundColor: Colors.blue[600],
                label: Text('Contact'),
                elevation: 5.0,
                tooltip: 'Contact',
                onPressed: () async {
                  _launchURL(user2["phone #"]);
                },
              ),
            )
          );
        }else{
          return Loading();
        }
        }
        );
  }
}

