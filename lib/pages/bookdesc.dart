import 'package:bookopedia/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookopedia/services/database.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';

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

  _launchPhone(String phone) async {

    dynamic url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWhatsapp(String phone, String uname, String bname) async {
    dynamic url = 'https://wa.me/$phone?text=Hi, I\'m $uname. I need the book "$bname" that you posted in Bookopedia. '
        'Kindly reply if you are interested in lending me the book. Thank you :)';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final user = Provider.of<User>(context);
    final BookData book1 = ModalRoute.of(context).settings.arguments;
    final height = MediaQuery.of(context).size.height;
    return isLoading5 ? Loading() : StreamBuilder(
        stream: Firestore.instance.collection('user_data').document(book1.userid).snapshots(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          var user2 = snapshot.data;
          return StreamBuilder(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      actions: <Widget>[
                        Container(
                            padding: EdgeInsets.all(13),
                            width: 58,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/pic.png'),
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
                                    width: 136.0,
                                    height: 175.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.blue[600],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/NotAvailable.jpg'),
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
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
                      visible: (book1.userid != userData.uid),
                      child: FloatingActionButton.extended(
                        icon: Icon(Icons.quick_contacts_dialer),
                        backgroundColor: Colors.blue[600],
                        label: Text('Contact'),
                        elevation: 5.0,
                        tooltip: 'Contact',
                        onPressed: () async {
                          if (userData.credit >= book1.creq) {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
                              context: context,
                              builder: (context){
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('How do you want to contact ?',
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            FloatingActionButton.extended(
                                              onPressed: (){
                                                _launchPhone(user2["phone #"]);
                                                Firestore.instance.collection("user_data")
                                                    .document(userData.uid)
                                                    .updateData({
                                                  'credit': FieldValue.increment(-book1.creq),
                                                });
                                              },
                                              icon: Icon(Icons.phone),
                                              backgroundColor: Colors.blue[900],
                                              label: Text('Phone'),
                                              elevation: 5.0,
                                              tooltip: 'Dial number',
                                            ),
                                            FloatingActionButton.extended(
                                              onPressed: () {
                                                _launchWhatsapp(user2["phone #"],userData.name,book1.bookname);
                                                Firestore.instance.collection("user_data")
                                                    .document(userData.uid)
                                                    .updateData({
                                                  'credit': FieldValue.increment(-book1.creq),
                                                });
                                              },
                                              icon: Icon(Icons.chat),
                                              backgroundColor: Colors.green[600],
                                              label: Text('WhatsApp'),
                                              elevation: 5.0,
                                              tooltip: 'Message on whatsapp',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },);
                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Sorry! You have insufficient credits. Add books inorder to earn credits'),
                            ));
                          }
                        },
                      ),
                    )
                );
              }else{
                return Loading();
              }
            }
          );
        }else{
          return Loading();
        }
        }
        );
  }
}

