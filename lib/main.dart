import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics_grammar.dart';
import 'package:antidotelanguagearabic/GUI/Subtopics_grammer_sarrf.dart';
import 'package:antidotelanguagearabic/GUI/Suggestion.dart';
import 'package:antidotelanguagearabic/blocs/auth_bloc.dart';
import 'package:antidotelanguagearabic/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GUI/ForgotPassword.dart';
import 'GUI/Home.dart';
import 'package:antidotelanguagearabic/GUI/Login.dart';
import 'package:antidotelanguagearabic/GUI/Home.dart';
import 'package:antidotelanguagearabic/GUI/Signup.dart';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:firebase_core/firebase_core.dart';

AuthService appAuth = new AuthService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget _defaultHome = new Home();
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new Subjectpage();
  }
  runApp(MaterialApp(
      title: 'ترياق لُغة',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/Login': (BuildContext context) => new Login(),
        '/Signup': (BuildContext context) => new Signup(),
        '/Subjectpage': (BuildContext context) => new Subjectpage(),
        '/AboutApp': (BuildContext context) => new AboutApp(),
        '/AboutCodeForIraq': (BuildContext context) =>  new AboutCodeForIraq(),
        '/ForgotPassword': (BuildContext context) => new ForgotPassword(),
        '/Suggestion': (BuildContext context) => new Suggestion(),
        '/Subtopicsdictation': (BuildContext context) =>  new Subtopicsdictation(),
        '/Subtopicsgrammar': (BuildContext context) =>  new Subtopicsgrammar(),
        '/Subtopicsgrammarsarrf': (BuildContext context) =>  new Subtopicsgrammarsarrf(),
        '/Resours': (BuildContext context) => new Resours(),
      },
        home: _defaultHome,
      //home: email == null ? Home() : Subjectpage()
  ),

  );

}

// class MyApp extends StatelessWidget {
//   final String email;
//
//   const MyApp({Key key, this.email}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => AuthBloc(),
//       child: MaterialApp(
//           title: 'ترياق لُغة',
//           routes: <String, WidgetBuilder>{
//             '/Home': (BuildContext context) => new Home(),
//             '/Login': (BuildContext context) => new Login(),
//             '/Signup': (BuildContext context) => new Signup(),
//             '/Subjectpage': (BuildContext context) => new Subjectpage(),
//             '/AboutApp': (BuildContext context) => new AboutApp(),
//             '/AboutCodeForIraq': (BuildContext context) =>  new AboutCodeForIraq(),
//             '/ForgotPassword': (BuildContext context) => new ForgotPassword(),
//             '/Suggestion': (BuildContext context) => new Suggestion(),
//             '/Subtopicsdictation': (BuildContext context) =>  new Subtopicsdictation(),
//             '/Subtopicsgrammar': (BuildContext context) =>  new Subtopicsgrammar(),
//             '/Subtopicsgrammarsarrf': (BuildContext context) =>  new Subtopicsgrammarsarrf(),
//             '/Resours': (BuildContext context) => new Resours(),
//           },
//      //   home: _defaultHome,
//           home: email == null ? Home() : Subjectpage()
//       ),
//     );
//   }
// }
