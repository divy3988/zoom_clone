import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestorMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get meetingHistory => _firebaseFirestore
      .collection("users")
      .doc(_auth.currentUser!.uid)
      .collection("meetings")
      .snapshots();
  void addmeeting({required String meeting}) async {
    try {
      _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .add({'meeting Name': meeting, 'Date-Time': DateTime.now()});
    } catch (e) {
      print(e);
    }
  }
}
