import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Login.dart';
import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


Future<void> showMyDialog(BuildContext context) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تسجيل خروج'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('هل أنت مُتأكد من تسجيل الخروج؟'),

            ],
          ),
        ),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('نعم'),
            onPressed:  () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Login', (Route<dynamic> route) => false);
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('كلا'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

//ـــــــــــــــــــــــــــــــ
Future<void> aboutAppAlertDialog(BuildContext context) async {
  return await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutApp()),
              ),
              child: const Text(
                'عن التطبيق',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'El_Messiri',
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutCodeForIraq()),
              ),
              child: const Text(
                'عن المبادرة',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'El_Messiri',
                ),
              ),
            ),
          ],
        );
      });
}

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.deepPurple.shade100))),
        child: InkWell(
          splashColor: Colors.deepPurpleAccent.shade100,
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerRight,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      icon,
                      color: Colors.deepPurpleAccent.shade200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        text,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.5,
                          fontFamily: 'El_Messiri',
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_left,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget antidotelanguage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text('A',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 88,
            fontFamily: 'Plaster',
            fontWeight: FontWeight.w700,
          )),
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('ntidote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontFamily: 'Poiret_One',
                fontWeight: FontWeight.w700,
              )),
          new Text('Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Aclonica',
                fontWeight: FontWeight.w700,
              )),
        ],
      ),
    ],
  );
}

Future<void> aboutAppDrawer(BuildContext context) async {
  return await Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
          ),
          child: antidotelanguage(),
        ),
        CustomListTitle(
            Icons.app_blocking,
            'عن التطبيق',
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutApp()),
                  ),
                }),
        CustomListTitle(
            Icons.announcement,
            'عن المُبادرة',
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutCodeForIraq()),
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
  );
}
