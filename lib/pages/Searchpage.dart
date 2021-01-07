//import 'package:bookopedia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookSearch extends SearchDelegate<String> {


  Future<List> searchBooks() async {
    List<String> bookList;
    final List<DocumentSnapshot> documents = (await Firestore.instance
        .collection('book_data')
        .where("booksearch",arrayContains: query)
        .getDocuments())
        .documents;
    bookList = documents.map((documentSnapshot) {
      documentSnapshot['bookname'] as String;
    }).toList();
    return bookList;
  }

  final recentSearch = [];

  List<String> books;
  void getStringList() async {
    var tempList = await searchBooks();
    books = tempList.toList();
    books.add("test");
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      for (int i = 0; i < books.length; i++) {
        print(books[i]);
      }
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,), onPressed: (){
          close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
      recentSearch.add(query);
      getStringList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getStringList();
    final suggestionList = query.isEmpty? recentSearch : books;
    return ListView.builder(itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.history),
        title: Text(suggestionList[index])
      ),
      itemCount: suggestionList?.length ?? 0,
    );
  }
}