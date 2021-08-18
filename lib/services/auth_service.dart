import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final _auth = FirebaseAuth.instance;
//
//   Future<UserCredential> signInWithCredential(AuthCredential credential) =>
//   _auth.signInWithCredential(credential);
//   Future<void> logout() => _auth.signOut();
//   Stream<User> get currentUser => _auth.authStateChanges();
//
//
//
//
// }

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User> get currentUser => _auth.authStateChanges();

  Future<bool> login() async {
    // Simulate a future for response after 2 second.
    return await new Future<bool>.delayed(
        new Duration(
            seconds: 1
        ), () => new Random().nextBool()
    );
  }


  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
     await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
