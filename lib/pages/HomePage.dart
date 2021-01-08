import 'package:bookopedia/pages/Add_Books.dart';
import 'package:bookopedia/pages/book_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bookopedia/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:bookopedia/models/book.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddBooks()));
  }

  bool isLoading2 = false;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final height = MediaQuery.of(context).size.height;
    return isLoading2 ? Loading() : StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return StreamProvider<List<BookData>>.value(
              value: DatabaseService().books,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                  height: height,
                  child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -MediaQuery.of(context).size.height * .28,
                          right: -MediaQuery.of(context).size.width * .4,
                          child: BezierContainer(),
                        ),
                        Padding(
                              padding: const EdgeInsets.fromLTRB(18, 26, 0, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: ':) H',
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue[600],
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'o',
                                          style: TextStyle(color: Colors.white, fontSize: 35),
                                        ),
                                        TextSpan(
                                          text: 'wdy \n         ',
                                          style: TextStyle(color: Colors.blue[600], fontSize: 35),
                                        ),
                                        TextSpan(
                                          text: userData.name,
                                          style: TextStyle(color: Colors.white, fontSize: 23,
                                          fontWeight: FontWeight.w500),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        Visibility(
                          visible: (userData.credit > 4),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18,145,0,0),
                            child: Text("Books you might like:",
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w600),),
                          ),
                        ),
                        Visibility(
                          visible: (userData.credit > 4),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,175,0,70),
                              child: BookList(),
                            ),
                          ),
                        ),
                        ]
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  icon: Icon(Icons.add),
                  backgroundColor: Colors.blue[600],
                  label: Text('Add Books'),
                  elevation: 2.0,
                  tooltip: 'Add books',
                  onPressed: () {
                    navigateToSubPage(context);
                  },
                )
        ),
            );
      }else{
            return Loading();
          }
    }
    );
  }
}