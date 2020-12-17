import 'package:bookopedia/models/user.dart';
import 'package:bookopedia/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //to create user obj
  User _userFirebase(FirebaseUser user) {
    return user!=null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFirebase(user));
        //.map(_userFirebase);
  }


  Future regEmail(String email, String password, String name, String admno, String dept, String sem, int credit, int numbook, String number) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(name, admno, dept, sem, credit, numbook, number);
      return _userFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

}