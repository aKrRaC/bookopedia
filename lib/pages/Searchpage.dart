import 'package:bookopedia/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Searchpage extends StatefulWidget {

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  BookData book;

  Future<List<BookData>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    final List<DocumentSnapshot> bookList =
        (await Firestore.instance
            .collection('book_data')
            .where("booksearch",arrayContains: search)
            .getDocuments())
    .documents;
    return List.generate(bookList.length, (int index) {
      return BookData(
        bookname: book.bookname,
        author: book.author,
      );
    });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: SearchBar<BookData>(
            crossAxisCount: 1,
            hintText: 'Search',
            cancellationWidget: Icon(
              Icons.close,
              color: Colors.grey,
            ) ,
            searchBarStyle: SearchBarStyle(
              padding: EdgeInsets.all(2),
              borderRadius: BorderRadius.circular(10),
            ),
            iconActiveColor: Colors.white,
            emptyWidget: Center(
              child: Text("No results found! :(",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            textStyle: TextStyle(
                color: Colors.white
            ),
            onSearch: search,
            onItemFound: (BookData book , int index) {
              return ListTile(
                title: Text(
                  book.bookname,
                  style: TextStyle(
                      color: Colors.red
                  ),
                ),
                subtitle: Text(
                  book.author,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              );
            },
          ),
        ),
      ) ,
    );
  }
}