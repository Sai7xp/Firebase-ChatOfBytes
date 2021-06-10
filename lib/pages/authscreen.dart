import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';

String name;
String email;
String imageUrl;

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isVisible = false;
  Future<FirebaseUser> _signIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoUrl;

    // Only taking the first part of the name, i.e., First Name
    /*  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  } */

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('useremail', currentUser.email);
    sharedPreferences.setString('username', currentUser.displayName);
    sharedPreferences.setString('userimage', currentUser.photoUrl);
    sharedPreferences.setString('userphone', currentUser.phoneNumber);
    print(currentUser.phoneNumber);
    sharedPreferences.setString('userid', currentUser.uid);

    //Checking and Adding user details to database
    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("newUsers")
          .where('uid', isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> userdocs = result.documents;

      if (userdocs.length == 0) {
        Firestore.instance.collection('/newUsers').document(user.uid).setData({
          'email': user.email,
          'uid': user.uid,
          'username': user.displayName,
          'userimage': user.photoUrl,
          'createdAt': DateTime.now(),
        }).catchError((e) {
          print(e);
        });
        // Adding
        Fluttertoast.showToast(msg: "Signed in successfully");
      } else {
        Fluttertoast.showToast(msg: "Welcome back!");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var swidth = size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Hexcolor(myColors.primary)),
                  ),
                  visible: isVisible,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 60.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 54.0,
                width: swidth / 1.36,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      this.isVisible = true;
                    });
                    _signIn().whenComplete(() {
                      Navigator.pushReplacementNamed(context, "/home");
                    }).catchError((onError) {
                      Navigator.pushReplacementNamed(context, "/auth");
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.google,
                          color: Hexcolor(myColors.primary)),
                      SizedBox(
                        width: 10.0,
                      ),
                      const Text(' Continue With Google',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Quicksand',
                          )),
                    ],
                  ),
                  color: Hexcolor(myColors.secondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  textColor: Colors.blueGrey,
                  elevation: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
