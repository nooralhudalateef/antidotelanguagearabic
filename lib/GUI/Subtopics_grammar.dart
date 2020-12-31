import 'dart:async';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:antidotelanguagearabic/GUI/Content.dart';
import 'package:antidotelanguagearabic/models/grammar.dart';

import 'Content_grammar.dart';
class Subtopicsgrammar extends StatefulWidget{
  @override
  _SubtopicsgrammarState createState()  => new _SubtopicsgrammarState();

}

final GrammarReference = FirebaseDatabase.instance.reference().child('grammar');
class _SubtopicsgrammarState extends State<Subtopicsgrammar>{

  List<Grammar> items;
  StreamSubscription<Event> _onGrammarAddedSubscription;
  StreamSubscription<Event> _onGrammarChangedSubscription;

  @override
  void initState(){
    super.initState();
    items = new List();
    _onGrammarAddedSubscription = GrammarReference.onChildAdded.listen(_onGrammarAdded);
   // _onGrammarChangedSubscription = GrammarReference.onChildChanged.listen(_onGrammarUpdated);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onGrammarAddedSubscription.cancel();
    _onGrammarChangedSubscription.cancel();
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
            'النحو',
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
                        onTap:  () => _navigateToGrammar(context, items[position] )
                    ),

                  ],

                );

              }
          ),
        ),
      ),
    );
  }
  void _onGrammarAdded(Event event){
    setState((){
      items.add(new Grammar.fromSnapShot(event.snapshot));
    });
  }
  //
  // void _onGrammarUpdated(Event event){
  //   var oldStudentValue = items.singleWhere((student) => student.id == event.snapshot.key);
  //   setState((){
  //     items[items.indexOf(oldStudentValue)] = new Grammar.fromSnapShot(event.snapshot);
  //   });
  // }

  void _deleteStudent(BuildContext context, Grammar dictation,int position)async{
    await GrammarReference.child(dictation.id).remove().then((_){
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToGrammar(BuildContext context,Grammar grammar)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ContentGrammar(grammar)),
    );

  }


  // void _createNewStudent(BuildContext context)async{
  //   await Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => StudentScreen(Grammar(null,'', '' ))),
  //   );
  // }

}