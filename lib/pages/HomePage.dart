import 'package:bookopedia/pages/Add_Books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bookopedia/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/shared/loading.dart';

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
            return Scaffold(
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
                            padding: const EdgeInsets.all(26.0),
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
                                        style: TextStyle(color: Colors.white, fontSize: 22),
                                      ),
                                  ],
                                ),
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
        );
      }else{
            return Loading();
          }
    }
    );
  }
}