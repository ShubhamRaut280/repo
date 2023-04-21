import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/models/chat_user.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for firebase database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // to return current user
  static User get user => auth.currentUser!;

  //  for checking that the user is already present or not
  static Future<bool> userExist() async{
    return (await firestore.collection('users').doc(auth.currentUser!.uid).get()).exists;
  }


// for creating  new user

static Future<void> createUser() async{
  final time = DateTime.now().millisecondsSinceEpoch.toString();

  final chatUser = ChatUser(image: user.photoURL.toString(), about: "Hey, I am using Gupshup !", name: user.displayName.toString(), createdAt:time, lastActive: time, isOnline: false, id: user.uid, email: user.email.toString(), pushToken:' ' );

return (await firestore.collection('users').doc(user.uid).set(chatUser.toJson()));
}
}


