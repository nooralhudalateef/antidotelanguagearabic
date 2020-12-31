import 'dart:async';
import 'package:antidotelanguagearabic/GUI/Subtopics.dart';
import 'package:antidotelanguagearabic/models/grammar_sarrf.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Content_grammar_sarrf.dart';
class Subtopicsgrammarsarrf extends StatefulWidget{
  @override
  _SubtopicsgrammarsarrfState createState()  => new _SubtopicsgrammarsarrfState();

}

final studentReference1 = FirebaseDatabase.instance.reference().child('grammar_sarrf');
class _SubtopicsgrammarsarrfState extends State<Subtopicsgrammarsarrf>{

  List<GrammarSarrf> items;
  StreamSubscription<Event> _onGrammarSarrfAddedSubscription;
  StreamSubscription<Event> _onGrammarSarrfChangedSubscription;

  @override
  void initState(){
    super.initState();
    items = new List();
   _onGrammarSarrfAddedSubscription = studentReference.onChildAdded.listen(_onGrammarSarrfAdded);
  // _onGrammarSarrfChangedSubscription = studentReference.onChildChanged.listen(_onGrammarSarrfUpdated);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onGrammarSarrfAddedSubscription.cancel();
    _onGrammarSarrfChangedSubscription.cancel();
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
            'الصرف',
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
                        onTap:  () => _navigateToGrammarSarrf(context, items[position] )
                    ),

                  ],

                );
              }
          ),
        ),
      ),
    );
  }
  void _onGrammarSarrfAdded(Event event){
    setState((){
      items.add(new GrammarSarrf.fromSnapShot(event.snapshot));
    });
  }
  // void _onGrammarSarrfUpdated(Event event){
  //   var oldStudentValue = items.singleWhere((student) => student.id == event.snapshot.key);
  //   setState((){
  //     items[items.indexOf(oldStudentValue)] = new GrammarSarrf.fromSnapShot(event.snapshot);
  //   });
  // }
  void _navigateToGrammarSarrf(BuildContext context,GrammarSarrf grammar_sarrf)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ContentGrammarSarrf(grammar_sarrf)),
    );

  }

}
























