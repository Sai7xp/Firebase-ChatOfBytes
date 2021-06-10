import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_blog/pages/authScreen.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color majorcolor = Hexcolor(myColors.primary);
  Color txtcolor = Hexcolor('#2F2D52');
  logOut(BuildContext context) {
    showDialog(                  
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Confirm Logout ?',
                style: TextStyle(
                    fontFamily: 'Quicksand', color: Hexcolor(myColors.pinkish)),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text('No',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Hexcolor(myColors.primary)))),
                FlatButton(
                    onPressed: () {
                      name = '';
                      email = '';
                      Navigator.pushReplacementNamed(context, "/auth");
                      googleSignIn.signOut();
                    },
                    child: Text('Yes',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Hexcolor(myColors.primary),
                            fontWeight: FontWeight.w500))),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Hexcolor(myColors.primary2),
          elevation: 0,
          title: Text(
            "My Profile",
            style: TextStyle(fontFamily: "Quicksand"),
          ),
          centerTitle: false,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 14.0),
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //FIRST
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(userimage),
                      backgroundColor: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text(
                      username,
                      style: TextStyle(
                          color: majorcolor,
                          fontSize: 24.0,
                          fontFamily: "QuickSand",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.black.withOpacity(.02))
                ]),
                child: Card(
                  color: Colors.white,
                  elevation: 0.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: txtcolor,
                        ),
                        title: Text(
                          username,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: majorcolor,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.mail,
                          color: txtcolor,
                        ),
                        title: Text(
                          usermail,
                          style: TextStyle(
                              fontFamily: 'Quicksand', color: majorcolor),
                        ),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.supervisor_account,
                          color: txtcolor,
                        ),
                        title: Text(
                          "Invite",
                          style: TextStyle(
                              fontFamily: 'Quicksand', color: majorcolor),
                        ),
                        onTap: () {},
                        trailing: Icon(Icons.arrow_right),
                        subtitle: Text(
                          "Friends & Family",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: txtcolor,
                        ),
                        title: Text(
                          "Help",
                          style: TextStyle(
                              fontFamily: 'Quicksand', color: majorcolor),
                        ),
                        onTap: () {},
                        trailing: Icon(Icons.arrow_right),
                        subtitle: Text(
                          "Contact, Report Issues",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help,
                          color: txtcolor,
                        ),
                        onTap: () async {
                          print("Fuck you bitch");
                          name = '';
                          email = '';
                          await FirebaseAuth.instance.signOut();
                          await googleSignIn.disconnect();
                          await googleSignIn.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => AuthScreen()),
                              (Route<dynamic> route) => false);
                        },
                        title: Text(
                          "Log Out",
                          style: TextStyle(
                              fontFamily: 'Quicksand', color: majorcolor),
                        ),
                        trailing: Icon(Icons.arrow_right),
                        subtitle: Text(
                          "Come back later",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      )
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
