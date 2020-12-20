import 'package:bookopedia/pages/bookdesc.dart';
import 'package:flutter/material.dart';
import 'package:bookopedia/models/book.dart';

class BookTile extends StatelessWidget {

  final BookData book;
  BookTile({ this.book });

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
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
          onTap: (){
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
  }
}
