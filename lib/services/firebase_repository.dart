import 'package:firebase_blog/models/message.dart';
import 'package:firebase_blog/models/user.dart';
import 'package:firebase_blog/services/firebase_functions.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<void> addMessageToDb(Message message, User sender, User receiver) =>
      _firebaseMethods.addMessageToDb(message, sender, receiver);
}
