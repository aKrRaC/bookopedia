import 'package:bookopedia/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookdesc extends StatefulWidget {
  @override
  _BookdescState createState() => _BookdescState();
}

class _BookdescState extends State<Bookdesc> {


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
    final BookData book1 = ModalRoute.of(context).settings.arguments;
    final height = MediaQuery.of(context).size.height;
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
                    SizedBox(height: height*.04,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Center(
                        child: Container(
                          width: 145.0,
                          height: 175.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue[600],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage('assets/images/cover.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.04,),
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
                    SizedBox(height: height*0.01,),
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
                      margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue[800],
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 24.0),
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
                                  SizedBox(height: height*0.02,),
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
                                        'Name: ${book1.username}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Department: ${book1.userdept}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Semester: ${book1.usersem}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Contact: ${book1.contact}',
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
                    SizedBox(height: height*.15,)
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.quick_contacts_dialer),
        backgroundColor: Colors.blue[600],
        label: Text('Contact'),
        elevation: 5.0,
        tooltip: 'Contact',
        onPressed: () {

        },
      ),
    );
  }
}

