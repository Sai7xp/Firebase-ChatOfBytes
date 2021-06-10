import 'package:firebase_blog/Components/storywidget.dart';
import 'package:firebase_blog/pages/chatspage.dart';
import 'package:firebase_blog/pages/chatspage.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:firebase_blog/pages/developer.dart';
import 'package:firebase_blog/pages/userprofile.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MaterialApp(
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: MainScreen()));

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static double _width = 0.0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle btnstyle = TextStyle(
      fontFamily: 'Quicksand',
      color: Hexcolor('#efefef'),
      fontSize: _width / 28.4);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Story(),
    Developer(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var swidth = size.width;
    setState(() {
      _width = swidth;
    });
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Hexcolor('#ffffff'),
                color: Hexcolor(myColors.primary),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Hexcolor(myColors.primary2),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    textStyle: btnstyle,
                  ),
                  GButton(
                    icon: LineIcons.comments,
                    text: 'Chats',
                    textStyle: btnstyle,
                  ),
                  GButton(
                    icon: LineIcons.fire,
                    text: 'About',
                    textStyle: btnstyle,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    textStyle: btnstyle,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
