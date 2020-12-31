import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/Subtopics_grammer_sarrf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics_grammar.dart';

class Subjectpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SubjectpageState();
  }
}

class SubjectpageState extends State<Subjectpage> {
  @override
  void initState() {}
  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;

  Widget _buildRaisedButtonButton(Function onPressed, text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 2.0,
        color: Colors.deepPurpleAccent,
        onPressed: onPressed,
        child: Text(
          '$text',
          style: FontSubjectTextStyle,
        ),
        padding: EdgeInsets.all(30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.grey,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              aboutAppAlertDialog(context);
            },
          )
        ],
        title: const Text(
          'الصفحة الرئيسة',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'El_Messiri',
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
          //textDirection: TextDirection.rtl,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 2.0,
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  _navigateTodictation(context);
                },
                child: Text(
                  'الإملاء',
                  style: FontSubjectTextStyle,
                ),
                padding: EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 2.0,
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  _navigateToSubtopicsgrammar(context);
                },
                child: Text(
                  'النحو',
                  style: FontSubjectTextStyle,
                ),
                padding: EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 2.0,
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  _navigateToSubtopicsgrammarsarrf(context);
                },
                child: Text(
                  'الصرف',
                  style: FontSubjectTextStyle,
                ),
                padding: EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTodictation(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Subtopicsdictation()),
    );
  }

  void _navigateToSubtopicsgrammar(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Subtopicsgrammar()),
    );
  }

  void _navigateToSubtopicsgrammarsarrf(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Subtopicsgrammarsarrf()),
    );
  }
}