import 'dart:async';
import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Loading.dart';
import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics_grammer_sarrf.dart';
import 'package:antidotelanguagearabic/GUI/Suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  StreamSubscription<User> loginStateSubscription;
  bool loading = false;
  String error = '';
  String id;
  final _formKey = GlobalKey<FormState>();
  @override
  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              shadowColor: Colors.grey,
              centerTitle: true,
              actions: <Widget>[],
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
            body: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('A',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 70,
                              fontFamily: 'Plaster',
                              fontWeight: FontWeight.w700,
                            )),
                        new Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text('ntidote',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 34,
                                  fontFamily: 'Poiret_One',
                                  fontWeight: FontWeight.w700,
                                )),
                            new Text('Language',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 18,
                                  fontFamily: 'Aclonica',
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 2.0,
                        color: Colors.deepPurpleAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  Subtopicsdictation()),
                            ).then((value) {
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                            else {
                              setState(() {
                                loading = false;
                                error = 'تأكد من الاتصال بالإنترنيت';
                              });
                            }
                        },

                        child: Text(
                          'الإملاء',
                          style: FontSubjectTextStyle,
                        ),
                        padding: EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 2.0,
                        color: Colors.deepPurpleAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Subtopicsgrammar()),
                            ).then((value) {
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                          else {
                            setState(() {
                              loading = false;
                              error = 'تأكد من الاتصال بالإنترنيت';
                            });
                          }
                        },


                        child: Text(
                          'النحو',
                          style: FontSubjectTextStyle,
                        ),
                        padding: EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 2.0,
                        color: Colors.deepPurpleAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Subtopicsgrammarsarrf()),
                            ).then((value) {
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                          else {
                            setState(() {
                              loading = false;
                              error = 'تأكد من الاتصال بالإنترنيت';
                            });
                          }
                        },

                        child: Text(
                          'الصرف',
                          style: FontSubjectTextStyle,
                        ),
                        padding: EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 2.0,
                        color: Colors.deepPurpleAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Suggestion()),
                            ).then((value) {
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                          else {
                            setState(() {
                              loading = false;
                              error = 'تأكد من الاتصال بالإنترنيت';
                            });
                          }
                        },
                        child: Text(
                          'مُقترحاتكم',
                          style: FontSubjectTextStyle,
                        ),
                        padding: EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                    child: antidotelanguage(),
                  ),
                  CustomListTitle(
                      Icons.phone_android,
                      'عن التطبيق',
                      () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutApp()),
                            ),
                          }),
                  CustomListTitle(
                      Icons.info,
                      'عن المُبادرة',
                      () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutCodeForIraq()),
                            ),
                          }),
                  CustomListTitle(
                      Icons.book,
                      'مصادر الشرح',
                      () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resours()),
                            ),
                          }),
                  CustomListTitle(
                    Icons.logout,
                    'تسجيل خروج',
                        () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/Login', (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
          );
  }

  // void _navigateTodictation(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Subtopicsdictation()),
  //   );
  // }
  //
  // void _navigateToSubtopicsgrammar(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Subtopicsgrammar()),
  //   );
  // }
  //
  // void _navigateToSubtopicsgrammarsarrf(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Subtopicsgrammarsarrf()),
  //   );
  // }
  //
  // void _navigateToSuggestion(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Suggestion()),
  //   );
  // }
}
