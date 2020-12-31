import 'package:flutter/material.dart';
import 'GUI/ForgotPassword.dart';
import 'GUI/Home.dart';
import 'package:antidotelanguagearabic/GUI/Login.dart';
import 'package:antidotelanguagearabic/GUI/Home.dart';
import 'package:antidotelanguagearabic/GUI/Signup.dart';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    TextEditingController _name;
    return new MaterialApp(

      routes: <String , WidgetBuilder>{
        '/Home': (BuildContext  context) => new Home(),
        '/Login': (BuildContext  context) => new Login(),
        '/Signup': (BuildContext  context) => new Signup(),
        '/Subjectpage': (BuildContext  context) => new Subjectpage(),
       // '/Subtopics': (BuildContext  context) => new Subtopics(),
       // '/Content': (BuildContext  context) => new Content(),
        '/AboutApp': (BuildContext  context) => new AboutApp(),
        '/AboutCodeForIraq': (BuildContext  context) => new AboutCodeForIraq(),
        '/ForgotPassword': (BuildContext  context) => new ForgotPassword(),
      },
      home: new Home(


      ),

    );

  }
}






