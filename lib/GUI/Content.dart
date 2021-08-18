import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Loading.dart';
import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:antidotelanguagearabic/models/dictation.dart';

class Content extends StatefulWidget {
  final Dictation dictation;
  Content(this.dictation);
  @override
  State<StatefulWidget> createState() {
    return new ContentState();
  }
}

class ContentState extends State<Content> {
  final studentReference =
      FirebaseDatabase.instance.reference().child('dictation');
  bool loading = false;
  String error = '';
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              // backgroundColor: Color(0xff92D0FF),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
              actions: <Widget>[],
              title: Text(
                widget.dictation.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'El_Messiri',
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Subtopicsdictation()),
                    );
                  }),
            ),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 2.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 13.0),
                            new Container(
                              padding: EdgeInsets.fromLTRB(10, 40.0, 10, 0.0),
                              child: Column(
                                children: <Widget>[
                                  new Text(
                                    widget.dictation.explanantion,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'El_Messiri',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
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
}
