import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(children: <Widget>[
        Positioned(
          top: 85,
          left: 105,
          right: 100,
          child: new Text('A',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 70,
                fontFamily: 'Plaster',
                fontWeight: FontWeight.w700,
              )),
        ),
        Positioned(
          top: 94,
          left: 160,
          right: 100,
          child: new Text('ntidote',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 34,
                fontFamily: 'Poiret_One',
                fontWeight: FontWeight.w700,
              )),
        ),
        Positioned(
          top: 135,
          left: 160,
          right: 100,
          child: new Text('Language',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 18,
                fontFamily: 'Aclonica',
                fontWeight: FontWeight.w700,
              )),
        ),
        Positioned(
          top: 168,
          left: 55,
          // right: 130,

          child: new Text('ترياق لغة، كُل ما يخص اللُغة العربية.',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontFamily: 'El_Messiri',
                fontWeight: FontWeight.w700,
              )),
        ),
        Positioned(
          top: 300,
          left: 100,
          right: 100,
          child: new Container(
            height: 122.5,
            width: 122.5,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 240,
          left: 23,
          right: 20,
          child: new Container(
            height: 42.5,
            width: 42.5,
            // alignment: Alignment(100, 80),
            // margin: EdgeInsets.all(4),
            //padding: EdgeInsets.all(2.5),

            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 250,
          left: 20,
          right: 124,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 276,
          left: 120,
          right: -30,
          child: new Container(
            height: 42.5,
            width: 42.5,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 270,
          left: 140,
          right: -60,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 287,
          left: 180,
          right: 120,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 250,
          left: 190,
          right: 120,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 263,
          left: 70,
          right: 220,
          child: new Container(
            height: 42.5,
            width: 42.5,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 395,
          left: 15,
          right: 188,
          child: new Container(
            height: 42.5,
            width: 42.5,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 360,
          left: 130,
          right: -70,
          child: new Container(
            height: 42.5,
            width: 42.5,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 430,
          left: 120,
          right: 100,
          child: new Container(
            height: 42.5,
            width: 42.5,
            //alignment: Alignment(100, 80),
            // margin: EdgeInsets.all(4),
            //padding: EdgeInsets.all(2.5),

            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB1B0B3),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.6,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        new Positioned(
          top: 423,
          left: 100,
          right: 150,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 420,
          left: 180,
          right: 30,
          child: new Container(
            height: 23.5,
            width: 23.5,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 320,
          left: 237,
          right: 30,
          child: new Container(
            height: 23.5,
            width: 23.5,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 338,
          left: 237,
          right: 89,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 355,
          left: -129,
          right: 50,
          child: new Container(
            height: 28.5,
            width: 28.5,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 330,
          left: -160,
          right: 76,
          child: new Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 290,
          left: -50,
          right: 30,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 300,
          left: -120,
          right: 90,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 399,
          left: 230,
          right: 100,
          child: new Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 420,
          left: 180,
          right: 90,
          child: new Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 325,
          left: -80,
          right: 60,
          child: new Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 440,
          left: -90,
          right: 20,
          child: new Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
        new Positioned(
          top: 520,
          left: 30,
          right: 30,
          child: new RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.of(context).pushNamed('/Signup');
            },
            elevation: (3.7),
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
            highlightColor: Colors.white,
            child: Text(
              'ابدأ',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'El_Messiri',
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
