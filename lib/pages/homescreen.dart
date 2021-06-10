import 'package:firebase_blog/posts/postui.dart';
import 'package:firebase_blog/posts/uploadpost.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_blog/pages/chatspage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = 'null',
    usermail = 'null',
    userimage = 'null',
    userphone = 'null',
    userid = 'null';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Null> _userdetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      usermail = sharedPreferences.getString("useremail");var currentUserDoc = await FirebaseFirestore.instance.collection('Users').doc()
      username = sharedPreferences.getString("username");
      userphone = sharedPreferences.getString("userphone");
      userimage = sharedPreferences.getString("userimage");
      userid = sharedPreferences.getString("userid");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._userdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firebase Posts",
          style: TextStyle(fontFamily: 'Quicksand', color: Hexcolor('#ffffff')),
        ),
        centerTitle: false,
        elevation: 1,
        backgroundColor: Hexcolor(myColors.primary2),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                LineIcons.comments,
                color: Colors.white,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              }),
        ],
      ),
      body: GetPosts(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => UploadPost()));
        },
        backgroundColor: Hexcolor(myColors.primary2),
        child: Icon(LineIcons.pencil),
        elevation: 2.2,
        tooltip: "Write Post",
      ),
    );
  }
}
