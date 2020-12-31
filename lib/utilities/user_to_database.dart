
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class UserToDatabase{
  addNewUser(user, context){
    FirebaseDatabase.instance.reference().child('users').push().set({

    }).then((value){

    }).catchError((e){
      print(e);
    });
  }
}