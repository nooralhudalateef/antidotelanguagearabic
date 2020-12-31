import 'package:firebase_database/firebase_database.dart';

class GrammarSarrf {
  String _id ;
  String _title;
  String _explanantion;


  GrammarSarrf(this._id,this._title,this._explanantion);


  GrammarSarrf.map(dynamic obj){
    this._title = obj['title'];
    this._explanantion = obj['explanantion'];
  }

  String get id => _id;
  String get title => _title;
  String get explanantion => _explanantion;

  GrammarSarrf.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _title = snapshot.value['title'];
    _explanantion = snapshot.value['explanantion'];
  }
}