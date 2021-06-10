import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_blog/utils/colors.dart';

class Story extends StatelessWidget {
  const Story({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor(myColors.primary2),
        elevation: 0,
        title: Text(
          "Stories",
          style: TextStyle(fontFamily: "Quicksand"),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10.0),
        children: <Widget>[
          Container(
            height: 105.0,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Hexcolor(myColors.primary2)),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.uikit),
                          color: Colors.white,
                          onPressed: () {},
                        )),
                    SizedBox(height: 7.0),
                    Text('Add Story',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(width: 25.0),
                listItem('assets/images/avatar1.png', 'Denver', true),
                SizedBox(width: 25.0),
                listItem('assets/images/icon2.png', 'Helsinki', false),
                SizedBox(width: 25.0),
                listItem('assets/images/avatar1.png', 'Berlin', false),
                SizedBox(width: 25.0),
                listItem('assets/images/avatar2.png', 'Rio', false),
                SizedBox(width: 25.0),
                listItem('assets/images/icon2.png', 'Arturo', true),
                SizedBox(width: 25.0),
                listItem('assets/images/icon2.png', 'Raquel', false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
                width: 135.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/ChatsPage");
                  },
                  child: Row(
                    children: <Widget>[
                      const Text('Go to Chats',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          )),
                    ],
                  ),
                  color: Hexcolor(myColors.primary2),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(28.0),
                  ),
                  textColor: Colors.blueGrey,
                  elevation: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgPath, String name, bool available) {
    return Column(
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.cover)),
        ),
        SizedBox(height: 7.0),
        Row(
          children: <Widget>[
            Text(name,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 4.0),
            available
                ? Container(
                    height: 8.0,
                    width: 8.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Hexcolor(myColors.secondary)),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
