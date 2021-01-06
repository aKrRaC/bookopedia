import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'userbook_tile.dart';

class UserBookList extends StatefulWidget {
  @override
  _UserBookListState createState() => _UserBookListState();
}

class _UserBookListState extends State<UserBookList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final books = Provider.of<List<BookData>>(context);
    if (books.isNotEmpty) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return UserBookTile(book2: books[index]);
        },
      );
    }else{
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height*.28,),
                Image(
                  image: AssetImage("assets/images/nope.png"),
                ),
                SizedBox(height: 3.0,),
                Text("\t\t  Seems pretty empty to me :(",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),
                )
              ],
            ),
            SizedBox(width: width*0.02,)
          ],
        ),
      );
    }
  }
}
