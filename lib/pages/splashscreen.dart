import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  navigateUser() {
    FirebaseAuth.instance.currentUser().then((currentUser) {
      if (currentUser == null) {
        Timer(Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, "/auth"));
      } else {
        Timer(Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, "/main"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Hexcolor('#2F2D52'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  FontAwesomeIcons.uikit,
                  size: 100.0,
                  color: Hexcolor('#E7EEFB'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
