import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
