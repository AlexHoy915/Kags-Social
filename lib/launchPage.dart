import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_application_1/signInSignUpPage.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInSignUpPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'), 
            SizedBox(height: 50),
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
          ],
        ),
      ),
    );
  }
}