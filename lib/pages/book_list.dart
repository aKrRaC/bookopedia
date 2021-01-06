import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_tile.dart';
import 'package:bookopedia/shared/loading.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  bool isLoading3 = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final books = Provider.of<List<BookData>>(context);
    if (books.isNotEmpty) {
      return isLoading3 ? Loading() :ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookTile(book: books[index]);
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
                SizedBox(height: height*.112,),
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
