// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_blog/pages/authscreen.dart';
// import 'package:firebase_blog/pages/splashscreen.dart';
// import 'package:firebase_blog/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// String name;
// String email1;
// String imageUrl1;

// Future<FirebaseUser> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     idToken: googleSignInAuthentication.idToken,
//     accessToken: googleSignInAuthentication.accessToken,
//   );
//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl1 = user.photoUrl;
//   print(imageUrl);

//   // Only taking the first part of the name, i.e., First Name
//   /*  if (name.contains(" ")) {
//     name = name.substring(0, name.indexOf(" "));
//   } */

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setString('useremail', currentUser.email);
//   sharedPreferences.setString('username', currentUser.displayName);
//   //Adding user details to database
//   Firestore.instance.collection('/users').add({
//     'email': email,
//     'uid': user.uid,
//     'username': user.displayName,
//     'userimage': user.photoUrl,
//   }).catchError((e) {
//     print(e);
//   });
//   print("User already exist");

//   return user;
// }

// Future<void> handleSignOut() {
//   googleSignIn.signOut();
//   googleSignIn.disconnect();
// }

//  UNUSED CODE FOR FUTURE REFERENCES