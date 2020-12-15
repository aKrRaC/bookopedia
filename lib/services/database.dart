import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookopedia/models/user.dart';

int credit = 0;
int numbook = 0;

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

  /*final CollectionReference bookCollection = Firestore.instance.collection('book_data');
  Future updateBookData(bookname, author, bdept, bsem) async {
    return await bookCollection.document(uid).setData({
      'book name': bookname,
      'author': author,
      'bookdepartment': bdept,
      'booksemester': bsem,
    });
  }*/

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data["name"],
        admnum: snapshot.data["admission #"],
        dept: snapshot.data["department"],
        sem: snapshot.data["semester"],
        number: snapshot.data["phone #"]
    );
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}

