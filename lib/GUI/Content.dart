import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff92D0FF),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () { aboutAppAlertDialog(context); },
          )
        ],
        title: Text(
          widget.dictation.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'El_Messiri',
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
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

    );
  }
}






















