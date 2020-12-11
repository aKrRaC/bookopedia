import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('user_data');
  Future updateUserData(name,admnum, dept, sem, number) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'admission #': admnum,
      'department': dept,
      'semester': sem,
      'phone #': number
    });
  }
}