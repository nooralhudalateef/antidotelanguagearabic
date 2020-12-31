import 'package:firebase_database/firebase_database.dart';

class Grammar {
  String _id ;
  String _title;
  String _explanantion;


  Grammar(this._id,this._title,this._explanantion);


  Grammar.map(dynamic obj){
    this._title = obj['title'];
    this._explanantion = obj['explanantion'];
  }

  String get id => _id;
  String get title => _title;
  String get explanantion => _explanantion;

  Grammar.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _title = snapshot.value['title'];
    _explanantion = snapshot.value['explanantion'];
  }
}