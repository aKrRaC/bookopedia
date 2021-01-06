import 'package:bookopedia/pages/bookdesc.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/models/book.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';

class BookTile extends StatelessWidget {

  final BookData book;
  BookTile({ this.book });

  @override

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;
            if (book.bdept == userData.dept && book.bsem == userData.sem &&
                book.useradmnum != userData.admnum  && userData.credit > 10) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue[800],
                  margin: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 0.0),
                  child: ListTile(
                    title: Text(book.bookname,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    subtitle: Text(book.author,
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
                            arguments: book,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
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
