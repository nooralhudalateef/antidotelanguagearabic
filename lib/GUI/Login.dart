import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _EmailController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();

  String userinfo = '';
  String userinfo1 = '';

  void onPressBtn() {
    setState(() {
      if (_EmailController.text.trim().isNotEmpty &&
          _PasswordController.text.trim().isNotEmpty) {
        userinfo = '${_EmailController.text}'
            '${_PasswordController.text}';
        '${Navigator.of(context).pushNamed('/Subjectpage')}';
      } else {
        userinfo1 = 'الرجاء أدخل المعلومات';
      }
    });
  }

  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 3.0),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xffFCFCFC),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
            controller: _EmailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'El_Messiri',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              suffixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'أدخل البريد الإلكتروني',
              // hintStyle: FontHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 3.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xffFCFCFC),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            textAlign: TextAlign.right,
            obscureText: true,
            controller: _PasswordController,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'El_Messiri',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              suffixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: 'كلمة المرور',
              // hintStyle: FontHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _EmailController.text,
                  password: _PasswordController.text)
              .then((user) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/Subjectpage', (Route<dynamic> route) => false);
          }).catchError((e) {
            print(e);
          });
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.deepPurpleAccent,
        child: Text(
          'تسجيل ',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'El_Messiri',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/Signup');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'هل لديك حساب قديم؟',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'El_Messiri',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' تسجيل دخول',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'El_Messiri',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    horizontal: 40.0,
                    vertical: 50.0,
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
                                fontSize: 44,
                                fontFamily: 'Plaster',
                                fontWeight: FontWeight.w700,
                              )),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('ntidote',
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 24,
                                    fontFamily: 'Poiret_One',
                                    fontWeight: FontWeight.w700,
                                  )),
                              new Text('Language',
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 14,
                                    fontFamily: 'Aclonica',
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),

                      Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          new Text(
                            'تسجيل جديد',
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
                      SizedBox(height: 30.0),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 13.0,
                      ),
                      _buildPassTextField(),

                      // SizedBox(height: 40.0, ),
                      // new Text($result),
                      SizedBox(
                        height: 40.0,
                      ),

                      _buildLoginButton(),
//
                      _buildSignupButton(),
                      SizedBox(
                        height: 40.0,
                      ),
                      new Text(
                        '$userinfo1',

                        // style: FontLabelTextStyle,
                      ),
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
