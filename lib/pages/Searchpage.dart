import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Searchpage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    Future<List<Post>> search(String search) async {
      await Future.delayed(Duration(seconds: 1));
      return List.generate(search.length, (int index) {
        return Post(
          "Title : $search $index",
          "Description :$search $index",
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: SearchBar<Post>(
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
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                subtitle: Text(
                  post.description,
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

class Post {
  final String title;
  final String description;
  Post(this.title, this.description);
}