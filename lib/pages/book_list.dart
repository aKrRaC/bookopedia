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
      return Loading();
    }
  }
}
