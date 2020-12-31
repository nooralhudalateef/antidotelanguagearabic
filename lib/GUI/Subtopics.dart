import 'dart:async';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:antidotelanguagearabic/models/dictation.dart';
import 'package:antidotelanguagearabic/GUI/Content.dart';
class Subtopicsdictation extends StatefulWidget{
  @override
  _SubtopicsdictationState createState()  => new _SubtopicsdictationState();

}

final studentReference = FirebaseDatabase.instance.reference().child('dictation');

class _SubtopicsdictationState extends State<Subtopicsdictation>{

  List<Dictation> items;
  StreamSubscription<Event> _onDictationAddedSubscription;
  StreamSubscription<Event> _onDictationChangedSubscription;

  @override
  void initState(){
    super.initState();
    items = new List();
    _onDictationAddedSubscription = studentReference.onChildAdded.listen(_onDictationAdded);
  //  _onDictationChangedSubscription = studentReference.onChildChanged.listen(_onDictationUpdated);

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
    return MaterialApp(
      title: 'ترياق لُغة',
      home: Scaffold(
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
              onPressed: () { aboutAppAlertDialog(context); },
            )
          ],
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
        ),
        body: Center(

          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context , position){
                return Column(
                  children: <Widget>[
                    // Divider(height: 6.0,),
                    ListTile(
                        title: Text(
                          '${items[position].title}',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style:  TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'El_Messiri',
                            fontSize: 22.0,

                          ),

                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 18.0,
                          child: Text('${position + 1}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        onTap:  () => _navigateToDictation(context, items[position] )
                    ),
                  ],

                );

              }
          ),
        ),
      ),
    );
  }
  void _onDictationAdded(Event event){
    setState((){
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


  void _navigateToDictation (BuildContext context,Dictation dictation)async{
    await Navigator.push(context,
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