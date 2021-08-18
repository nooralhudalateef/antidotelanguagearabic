import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';

class Resours extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ResoursState();
  }
}

class ResoursState extends State<Resours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: <Widget>[

        ],
        title: const Text(
          'المصادر',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'El_Messiri',
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
          //textDirection: TextDirection.rtl,
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed:(){  Navigator.push( context,
              MaterialPageRoute(builder: (context) => Subjectpage()),
            );}
        ),
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
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      new Container(
                        padding: EdgeInsets.fromLTRB(10, 10.0, 10, 0.0),
                        child: Column(
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
                            SizedBox(height: 60.0),
                            Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    new Text(
                                      '1- شرح الآجرومية',
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontFamily: 'El_Messiri',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                new Text(
                                  ' للفضيلة الشيخ العلامة مُحمّد بن صالح العثيمين، طٌبعَ بإشراف مؤسسة الشيخ مُحمد بن صالح العثيمين الخيرية.',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 15.5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    new Text(
                                      '2- مُلخص قواعد اللغة العربية',
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontFamily: 'El_Messiri',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                new Text(
                                  ' لفؤاد نعمة، مرحع كامل لقواعد النحو والصرف أُعد'
                                  ' بأسلوب شيّق ومُبتكر وبصورة مُبسطة سهلة ومُيتكرة.',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 15.5,
                                  ),
                                ),
                              ],
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
                    MaterialPageRoute(builder: (context) => AboutApp()),
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
                    MaterialPageRoute(builder: (context) => Resours()),
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
