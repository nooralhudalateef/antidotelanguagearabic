import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Login.dart';
import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Suggestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SuggestionState();
  }
}

class SuggestionState extends State<Suggestion> {
  var _emailFormKey = GlobalKey<FormState>();
  final TextEditingController _MassageController = new TextEditingController();
  String userinfo1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.grey,
        centerTitle: true,
        actions: <Widget>[],
        title: const Text(
          'إرسال مُقترح',
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Subjectpage()),
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
                    horizontal: 30.0,
                    vertical: 30.0,
                  ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 3.0),
                          Container(
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: Color(0xffFCFCFC),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: TextField(
                              textAlign: TextAlign.right,
                              controller: _MassageController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'El_Messiri',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 6.0, 0),

                                hintText: '...أُكتب هُنا ',
                                // hintStyle: FontHintTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Form(
                        key: _emailFormKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          width: double.infinity,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            padding: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.deepPurpleAccent,
                            elevation: 4.0,
                            onPressed: () {
                              if (_emailFormKey.currentState.validate()) {
                                sendMessage().then((user) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/Subjectpage',
                                      (Route<dynamic> route) => false);
                                }).catchError((e) {
                                  print(e);
                                });
                              }
                            },
                            child: Text(
                              'إرسال',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'El_Messiri',
                              ),
                            ),
                          ),
                        ),
                      ),
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
              () => () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }

  sendMessage() async {
    String inputEmail;
    String inputMessage;
    Email email;
    setState(() {
      inputEmail = 'nooralhudalateef@gmail.com';
      inputMessage = _MassageController.text;
      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          body: inputMessage,
          subject: 'Email subject',
          recipients: [inputEmail],
        );
        send(email);
      }
    });
    debugPrint('email - > $inputEmail  message -> $inputMessage');
  }

  void send(Email email) async {
    await FlutterEmailSender.send(email);
  }
}
