import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseMethods {
  Future<void> addUserData(Map<String, dynamic> userMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('User')
        .doc(id)
        .set(userMap);
  }

  Future<Stream<QuerySnapshot>> getUserData(String uid) async {
    return await FirebaseFirestore.instance
        .collection('User')
        .snapshots();
  }
}