import 'package:firebase_blog/pages/chatspage.dart';
import 'package:firebase_blog/pages/authscreen.dart';
import 'package:firebase_blog/pages/mainscreen.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:firebase_blog/pages/splashscreen.dart';
import 'package:firebase_blog/posts/uploadpost.dart';
import 'package:flutter/material.dart';

import 'Components/storywidget.dart';

var routes = <String, WidgetBuilder>{
  "/auth": (BuildContext context) => AuthScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/main": (BuildContext context) => MainScreen(),
  "/splash": (BuildContext context) => SplashScreen(),  
  "/uploadpost": (BuildContext context) => UploadPost(),
  "/StoryPage": (BuildContext context) => Story(),
  "/ChatsPage": (BuildContext context) => ChatPage(),
};
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Facebase',
    routes: routes,
    home: SplashScreen(),
  ));
}
