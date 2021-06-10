import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor(myColors.primary2),
        elevation: 0,
        title: Text(
          "About me",
          style: TextStyle(fontFamily: "Quicksand"),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/icon2.png"),
              radius: 56.0,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 25.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: _launchInsta,
                    color: Hexcolor(myColors.primary2)),
                IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: _launchTwiter,
                    color: Hexcolor(myColors.primary2)),
                IconButton(
                  icon: Icon(FontAwesomeIcons.envelope),
                  onPressed: _launchMail,
                  color: Hexcolor(myColors.primary2),
                ),
                IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: _launchURL,
                    color: Hexcolor(myColors.primary2)),
                IconButton(
                    icon: Icon(FontAwesomeIcons.whatsapp),
                    onPressed: _launchWhatsApp,
                    color: Hexcolor(myColors.primary2)),
                //  IconButton(icon: Icon(FontAwesomeIcons.instagram), onPressed: null),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Build and ship 🔥 your app.",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16.0,
                  color: Hexcolor(myColors.primary2)),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Created by Jonathan.",
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14.0,
                      color: Hexcolor('#8c8382')),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            /* SizedBox(
              height: 40.0,
              width: MediaQuery.of(context).size.width / 2.2,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  ' Buy me a Coffee',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                  ),
                ),
                color: Hexcolor(myColors.primary2),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                textColor: Colors.blueGrey,
                elevation: 5,
              ),
            ), */
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.github.com/Mr404Found';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("can't launch url");
      throw 'Could not launch $url';
    }
  }

  _launchInsta() async {
    const url = 'https://www.instagram.com/sumanth.zero7/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("can't launch url");
      throw 'Could not launch $url';
    }
  }

  _launchMail() async {
    const url = 'mailto:sumanth77snehi@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("can't launch url");
      throw 'Could not launch $url';
    }
  }

  _launchTwiter() async {
    const url = 'https://www.twitter.com/mr404found/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("can't launch url");
      throw 'Could not launch $url';
    }
  }

  _launchWhatsApp() async {
    String phoneNumber = '+919642183590';
    String message = "Hey! from firebase blog app. I've a project.";
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
