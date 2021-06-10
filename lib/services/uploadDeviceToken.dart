import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_blog/pages/authscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _messaging = FirebaseMessaging();
Future<String> _uploadToken() {
  _messaging.getToken().then((token) {
    Firestore.instance
        .collection('/newDeviceTokens')
        .add({"token": token, "usermail": email}).then((error) {
      print("Uploded device token to firebase");
    });
    print(token);
  });
}
