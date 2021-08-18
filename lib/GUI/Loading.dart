import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoadingState();
  }
}

class LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.deepPurple,
          size: 20.0,
        ),
      ),
    );
  }
}






