import 'package:bookopedia/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  String query = "";

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white, fontSize: 19),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 19
              )
          ),
          onChanged: (val) {
            setState(() {
              query = val;
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (query != "" && query != null)
            ? Firestore.instance
            .collection('book_data')
            .where("booksearch", arrayContains: query)
            .snapshots()
            : Firestore.instance.collection("book_data").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: Loading())
              : Container(
                color: Colors.black,
                child: Visibility(
                  visible: (query != ''),
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data.documents[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blue[800],
                            margin: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 0.0),
                            child: ListTile(
                              title: Text(data['bookname'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(data['author'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              onTap: () {

                              },
                            ),
                          ),
                        );
                      },
            ),
                ),
          );
        },
      ),
    );
  }
}