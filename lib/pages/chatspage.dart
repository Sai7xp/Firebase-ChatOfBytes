import 'package:firebase_blog/chatscreens/chatList.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Quicksand',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor(myColors.primary2),
        elevation: 0,
        title: Text(
          "My Chats",
          style: TextStyle(fontFamily: "Quicksand"),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                LineIcons.search,
                color: Colors.white,
                // size: 25.0,
              ),
              onPressed: () {}),
        ],
      ),
      body: ChatList(),
    );
  }
}
