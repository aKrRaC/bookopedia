import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookopedia/shared/loading.dart';
import 'sembook_tile.dart';

class SemBookList extends StatefulWidget {

  final String semnm;

  const SemBookList ({ Key key, this.semnm }): super(key: key);

  @override
  _SemBookListState createState() => _SemBookListState();
}

class _SemBookListState extends State<SemBookList> {

  @override
  Widget build(BuildContext context) {

    final books = Provider.of<List<BookData>>(context);
    if (books.isNotEmpty) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return SemBookTile(book4: books[index], semname: widget.semnm,);
        },
      );
    }else{
      return Loading();
    }
  }
}
