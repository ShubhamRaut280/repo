import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for firebase database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
