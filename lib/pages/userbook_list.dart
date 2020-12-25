import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/shared/loading.dart';
import 'userbook_tile.dart';

class UserBookList extends StatefulWidget {
  @override
  _UserBookListState createState() => _UserBookListState();
}

class _UserBookListState extends State<UserBookList> {
  @override
  Widget build(BuildContext context) {
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
      return Loading();
    }
  }
}
