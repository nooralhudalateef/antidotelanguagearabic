import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:antidotelanguagearabic/utilities/Constants.dart';
class AboutApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutAppState();
  }
}
class AboutAppState extends State<AboutApp> {
  @override
  void initState() {}

  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          'عن التطبيق',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'El_Messiri',
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
          //textDirection: TextDirection.rtl,
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
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      new Container(
                        padding: EdgeInsets.fromLTRB(10, 10.0, 10, 0.0),
                        child: Column(
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
                            Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                new Text(
                                  'فكرة التطبيق',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.0),
                            new Text(
                              'تطبيق ترياق لغة هو تطبيق خاص بشرح دروس اللغة العربية بجميع أقسامها من (إملاء، نحو، الصرف: والبلاغة) بطريقة مُبسطة. يستهدف التطبيق جميع الفئات الطلابية بكل المرحل كونه يحتوي على حميع المواضيع، وكذلك لأي شخص لديه يود تعلم اللغة وقواعدها.',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'El_Messiri',
                                fontSize: 18.0,
                              ),
                            ),

                            SizedBox(height: 20.0),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                new Text(
                                  'تنفيذ',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                new Text('نُور الهُدى لَطِيّف',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'El_Messiri',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
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
