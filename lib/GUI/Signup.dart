import 'dart:ui';
import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:antidotelanguagearabic/utilities/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:get/get.dart';
import 'ForgotPassword.dart';
class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignupState();
  }
}

class SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isloggedIn = false;
  UserCredential myUser;

  String name;
  String email;

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
    await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(user.email != null);
      assert(user.displayName != null);

      name = user.displayName;
      email = user.email;

      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }
  GoogleSignIn _googleSignIn = GoogleSignIn();
   final TextEditingController _EmailController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();

  String userinfo = '';
  String userinfo1 = '';

  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;

  Future<UserCredential> signInWithFacebook() async {
    final AccessToken accessToken = await FacebookAuth.instance.login();
    final FacebookAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(accessToken.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    
  }
  void _logIn() {
    signInWithFacebook().then((response) {
      if (response != null) {
        myUser = response;
        _isloggedIn = true;
        setState(() {});
      }
    });
    Navigator.of(context).pushNamedAndRemoveUntil('/Subjectpage',(Route<dynamic> route) => false);
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
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.right,
            controller: _EmailController,
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
          child: TextField(
            obscureText: true,
            textAlign: TextAlign.right,
            controller: _PasswordController,
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
      child: FlatButton(
        onPressed:  (){ Navigator.of(context).pushNamed('/ForgotPassword');
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'هل نسيت كلمة المرور؟',
          style: FontLabelTextStyle,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: (){

          FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _EmailController.text, password: _PasswordController.text
          ).then(( user ){
            Navigator.of(context).pushNamedAndRemoveUntil('/Subjectpage',(Route<dynamic> route) => false);
          }).catchError((e){
            print(e);
          });
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.deepPurpleAccent,
        child: Text(
          'تسجيل',
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- أو -',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'El_Messiri',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtonRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Login With Facebook
          _buildSocialBtn(
                (){_logIn();},
            AssetImage(
              'assets/logo/facebook.png',
            ),
          ),
          _buildSocialBtn(
                () {
              signInWithGoogle().then((result) {
                if (result != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil('/Subjectpage',(Route<dynamic> route) => false);
              }
              });
            },
            AssetImage(
              'assets/logo/google.png',
            ),
          ),
        ],
      ),
    );
  }

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
              // Center(
              //     child: _isloggedIn?
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         RaisedButton(
              //           child: Text("Login"),
              //           onPressed: (){
              //             _logIn();
              //           },
              //         ),
              //       ],
              //     )
              //         :Center(
              //       child: RaisedButton(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.0),
              //         ),
              //         child: Text("Login with Facebook"),
              //         onPressed: (){
              //           _logIn();
              //         },
              //       ),
              //     )
              // ),

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
                      SizedBox(height: 10.0),
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
                      SizedBox(height: 9.0),
                      // _buildNameTextField(),
                      SizedBox(
                        height: 13.0,
                      ),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 13.0,
                      ),
                      _buildPasswordTextField(),
                      // SizedBox(
                      //   height: 45.0,
                      // ),
                      SizedBox(
                        height: 1.0,
                      ),
                      _buildForgotPasswordButton(),
                      _buildLoginButton(),
                      SizedBox(
                        height: 9.0,
                      ),
                      _buildSignInWithText(),
                      _buildSocialButtonRow(),
                      _buildSignupButton(),
                      SizedBox(height: 40.0, ),
                      new Text('$userinfo1',

                        style: FontLabelTextStyle,
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
