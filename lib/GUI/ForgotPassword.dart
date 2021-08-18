import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _EmailController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();
  // TextEditingController email = TextEditingController();
  String userinfo = '';
  String userinfo1 = '';
  String _email;
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

  FirebaseAuth _auth = FirebaseAuth.instance;
  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(Signup());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }



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
                Icons.email,
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

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () {
          _auth.sendPasswordResetEmail(email: _email);
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.deepPurpleAccent,
        child: Text(
          'إرسال ',
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
                            'تغيير كلمة المرور',
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
                      SizedBox(
                        height: 40.0,
                      ),
                      _buildLoginButton(),
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

