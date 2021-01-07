import 'package:flutter/material.dart';
import 'package:bookopedia/models/book.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/shared/loading.dart';
import 'bookdesc.dart';

class SemBookTile extends StatelessWidget {

  final BookData book4;
  final semname;
  SemBookTile({ this.book4, this.semname });


  @override

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;
            if (book4.useradmnum != userData.admnum && book4.bsem == semname) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue[800],
                  margin: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 0.0),
                  child: ListTile(
                    title: Text(book4.bookname,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Text(book4.author,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bookdesc(),
                          settings: RouteSettings(
                            arguments: book4,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }else {
              return Container(
              );
            }
          }else{
            return Loading();
          }
        }
    );
  }
}
