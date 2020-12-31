import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
final FontHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'El_Messiri',

);
final FontLabelTextStyle = TextStyle(
  color: Colors.black87,
  fontFamily: 'El_Messiri',
);

final FontSubjectTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'El_Messiri',
  fontSize: 21.0,
);

void aboutAppAlertDialog(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    actions: <Widget>[
      new Column(
        children: <Widget>[
          new FlatButton(onPressed:()=> Navigator.of(context).pushNamed('/AboutApp'),
              child: new Text('عن التطبيق')),
          new FlatButton(onPressed: ()=> Navigator.of(context).pushNamed('/AboutCodeForIraq'),
              child: new Text('عن المبادرة')),
        ],
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
void LogoutAlertDialog(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    actions: <Widget>[
      new Column(
        children: <Widget>[
          new FlatButton(onPressed: null, child: new Text('تسجيل خروج')),
        ],
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}


