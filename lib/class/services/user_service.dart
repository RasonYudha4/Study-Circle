import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<String?> getUserNameById(String userId) async {
    DocumentSnapshot<Object?> snapshot =
        await _userCollection.doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      return data?['name'] as String?;
    }

    return null; // Return null if the user does not exist
  }
}
