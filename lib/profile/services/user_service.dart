import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserName(User user) {
    return _userCollection.doc(user.id).update({'name': user.name});
  }

  Future<Map<String, dynamic>?> fetchUserById(String userId) async {
    try {
      DocumentSnapshot<Object?> snapshot =
          await _userCollection.doc(userId).get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        return data; // Return the User object
      }

      return null; // Return null if the user does not exist
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
}
