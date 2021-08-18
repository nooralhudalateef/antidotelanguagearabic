import 'dart:async';
import 'package:antidotelanguagearabic/GUI/AboutApp.dart';
import 'package:antidotelanguagearabic/GUI/AboutCodeForIraq.dart';
import 'package:antidotelanguagearabic/GUI/Resours.dart';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:antidotelanguagearabic/models/dictation.dart';
import 'package:antidotelanguagearabic/GUI/Content.dart';


class Subtopicsdictation extends StatefulWidget {
  @override
  _SubtopicsdictationState createState() => new _SubtopicsdictationState();
}

final studentReference =
    FirebaseDatabase.instance.reference().child('dictation');

class _SubtopicsdictationState extends State<Subtopicsdictation> {
  List<Dictation> items;
  StreamSubscription<Event> _onDictationAddedSubscription;
  StreamSubscription<Event> _onDictationChangedSubscription;

  bool loading = false;
  String error = '';


  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    items = new List();
    _onDictationAddedSubscription =
        studentReference.onChildAdded.listen(_onDictationAdded);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onDictationAddedSubscription.cancel();
    _onDictationChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            title: 'ترياق لُغة',
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                shadowColor: Colors.grey,
                centerTitle: true,
                actions: <Widget>[],
                title: const Text(
                  'الإملاء',
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
              body: Center(
                  child: ListView.builder(
                      itemCount: items.length,
                      padding: EdgeInsets.only(top: 12.0),
                      itemBuilder: (context, position) {
                        return Column(
                          children: <Widget>[
                            // Divider(height: 6.0,),
                            ListTile(
                                title: Text(
                                  '${items[position].title}',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 22.0,
                                  ),
                                ),
                                trailing: CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 18.0,
                                  child: Text(
                                    '${position + 1}',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                onTap: () => _navigateToDictation(
                                    context, items[position])),
                          ],
                        );
                      }),
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
            ),
          );
  }

  void _onDictationAdded(Event event) {
    setState(() {
      items.add(new Dictation.fromSnapShot(event.snapshot));
    });
  }
  //
  // void _onDictationUpdated(Event event){
  //   var oldStudentValue = items.singleWhere((student) => student.id == event.snapshot.key);
  //   setState((){
  //     items[items.indexOf(oldStudentValue)] = new Dictation.fromSnapShot(event.snapshot);
  //   });
  // }

  // void _deleteStudent(BuildContext context, Dictation dictation,int position)async{
  //   await studentReference.child(dictation.id).remove().then((_){
  //     setState(() {
  //       items.removeAt(position);
  //     });
  //   });
  // }

  // void _navigateToStudent(BuildContext context,Dictation dictation)async{
  //   // await Navigator.push(context,
  //   //   MaterialPageRoute(builder: (context) => Content(dictation)),
  //   // );
  //
  // }

  void _navigateToDictation(BuildContext context, Dictation dictation) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Content(dictation)),
    );
  }
//
// void _createNewStudent(BuildContext context)async{
//   // await Navigator.push(context,
//   //   MaterialPageRoute(builder: (context) => StudentScreen(Dictation(null,'', '' ))),
//   // );
// }

}
