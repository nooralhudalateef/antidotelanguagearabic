import 'dart:async';
import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/Loading.dart';
import 'package:antidotelanguagearabic/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignupState();
  }
}

class SignupState extends State<Signup> {
  final TextEditingController _EmailController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  String id;
  String email = '';
  String password = '';
  final result = FirebaseAuth.instance;
  StreamSubscription<User> loginStateSubscription;

  @override
  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  Widget _buildEmailTextField() {
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
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.right,
            controller: _EmailController,
            validator: (val) =>
                val.isEmpty ? ' البريد الألكتروني يجب أن لا يكون فارغ' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              suffixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: 'أدخل البريد الإلكتروني',
              hintStyle: FontHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 3.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
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
          child: TextFormField(
            obscureText: true,
            textAlign: TextAlign.right,
            controller: _PasswordController,
            validator: (val) =>
                val.length < 6 ? 'أدخل كلمة مرور بطول 6+ أحرف ' : null,
            onChanged: (val) {
              setState(() => password = val);
            },
            // onSaved: (value) =>_password = value,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              suffixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              hintText: 'كلمة المرور',
              hintStyle: FontHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerLeft,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/ForgotPassword');
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'هل نسيت كلمة المرور؟',
          style: FontLabelTextStyle,
        ),
      ),
    );
  }

  // Widget _buildLoginButton() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 7.0),
  //     width: double.infinity,
  //     // ignore: deprecated_member_use
  //     child: RaisedButton(
  //       elevation: 4.0,
  //       onPressed: () {
  //         FirebaseAuth.instance
  //             .signInWithEmailAndPassword(
  //                 email: _EmailController.text,
  //                 password: _PasswordController.text)
  //             .then((user) {
  //           Navigator.of(context).pushNamedAndRemoveUntil(
  //               '/Subjectpage', (Route<dynamic> route) => false);
  //         }).catchError((e) {
  //           print(e);
  //         });
  //       },
  //       padding: EdgeInsets.all(10.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       color: Colors.deepPurpleAccent,
  //       child: Text(
  //         'تسجيل',
  //         style: TextStyle(
  //           color: Colors.white,
  //           letterSpacing: 1.5,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'El_Messiri',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       height: 40.0,
  //       width: 40.0,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 2),
  //             blurRadius: 6.0,
  //           ),
  //         ],
  //         image: DecorationImage(
  //           image: logo,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildSocialButtonRow() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         //Login With Facebook
  //         // _buildSocialBtn(
  //         //       (){ },
  //         //   AssetImage(
  //         //     'assets/logo/facebook.png',
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  // }
  //
  Widget _buildSignupButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/Login');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'إن كُنت لا تملك حساب!',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'El_Messiri',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' تسجيل جديد',
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

    return loading
        ? Loading()
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 100.0,
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
                                      fontSize: 88,
                                      fontFamily: 'Plaster',
                                      fontWeight: FontWeight.w700,
                                    )),
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('ntidote',
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 44,
                                          fontFamily: 'Poiret_One',
                                          fontWeight: FontWeight.w700,
                                        )),
                                    new Text('Language',
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 24,
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
                                  'تسجيل دخول',
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
                            SizedBox(
                              height: 22.0,
                            ),
                            _buildEmailTextField(),
                            SizedBox(
                              height: 22.0,
                            ),
                            _buildPasswordTextField(),
                            SizedBox(
                              height: 1.0,
                            ),
                            _buildForgotPasswordButton(),
                            SizedBox(
                              height: 13.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                              width: double.infinity,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                elevation: 4.0,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);

                                    result
                                        .signInWithEmailAndPassword(
                                            email: email, password: password)
                                        .then((value) {
                                      setState(() {
                                        id = value.user.uid;
                                      });
                                    });
                                    if (id == null) {
                                      setState(() {
                                        loading = true;
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                            '/Subjectpage',
                                                (Route<dynamic> route) =>
                                            false);
                                      });

                                    } else {
                                      setState(() {
                                        loading = false;
                                        error = 'تعذر تسجيل الدخول!';
                                      });
                                    }
                                  }
                                },
                                padding: EdgeInsets.all(10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.deepPurpleAccent,
                                child: Text(
                                  'تسجيل دخول',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'El_Messiri',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            _buildSignupButton(),
                            SizedBox(
                              height: 22.0,
                            ),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
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
