import 'package:flutter/material.dart';
import 'package:bookopedia/models/book.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:bookopedia/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bookdesc.dart';

class UserBookTile extends StatelessWidget {

  final BookData book2;
  UserBookTile({ this.book2 });


  @override

  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    void _showConfirmation() {
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
                Text('Are you sure that you want to delete the selected book ?',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    icon: Icon(Icons.delete),
                    backgroundColor: Colors.red,
                    label: Text('Delete book'),
                    elevation: 5.0,
                    tooltip: 'Delete',
                    onPressed: ()  {
                      Firestore.instance.collection("book_data").document(book2.bookid)
                          .delete();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },);
    }

    void pressed(butname) {
      if (butname == "View details"){
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bookdesc(),
            settings: RouteSettings(
              arguments: book2,
            ),
          ),
        );
      }
      else if(butname == "Delete book "){
        Navigator.of(context).pop();
        _showConfirmation();
      }
    }

    Widget button(String butname) {
      return ButtonTheme(
        height: 60,
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            splashColor: Colors.blue[600],
            onPressed: () {
              pressed(butname);
            },
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    butname,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(width: width-185,),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 15.0,
                )
              ],
            )),
      );
    }

    void _showOptions() {
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
                button("View details"),
                button("Delete book "),
              ],
            ),
          );
        },);
    }
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;
            if (book2.useradmnum == userData.admnum) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue[800],
                  margin: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 0.0),
                  child: ListTile(
                    title: Text(book2.bookname,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    subtitle: Text(book2.author,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onTap: () {
                      _showOptions();
                    },
                  ),
                ),
              );
            } else {
              return Container();
            }
          }else{
            return Loading();
          }
        }
    );
  }
}
