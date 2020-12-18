import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/models/book.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('user_data');
  Future updateUserData(name, admnum, dept, sem, credit, numbook, number) async {
    return await userCollection.document(uid).setData({
      'userid': uid,
      'name': name,
      'admission #': admnum,
      'department': dept,
      'semester': sem,
      'credit': credit,
      'book #': numbook,
      'phone #': number
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data["name"],
        admnum: snapshot.data["admission #"],
        dept: snapshot.data["department"],
        sem: snapshot.data["semester"],
        number: snapshot.data["phone #"],
        credit: snapshot.data['credit'],
        numbook: snapshot.data['book #'],
    );
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  List<BookData> _bookListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return BookData(
        bookname: doc.data['bookname'],
        author: doc.data['author'],
        bdept: doc.data['department'],
        bsem: doc.data['semester'],
        edition: doc.data['edition'],
        userid: doc.data['userid'],
        username: doc.data['username'],
        userdept: doc.data['userdept'],
        usersem: doc.data['usersem'],
        contact: doc.data['contact'],
      );
    }).toList();
  }

  final CollectionReference bookCollection = Firestore.instance.collection('book_data');
  Stream<List<BookData>> get books {
    return bookCollection.snapshots()
        .map(_bookListFromSnapshot);
  }

}

