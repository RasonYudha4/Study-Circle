import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserName(User user) {
    return _userCollection.doc(user.id).update({'name': user.name});
  }

  Future<String?> getUserNameById(String userId) async {
    DocumentSnapshot<Object?> snapshot =
        await _userCollection.doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      return data?['name'] as String?;
    }

    return null; // Return null if the user does not exist
  }

  Future<User?> getUserById(String userId) async {
    DocumentSnapshot<Object?> snapshot =
        await _userCollection.doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      return User.fromJson(userId, data!);
    }

    return null; // Return null if the user does not exist
  }
}
