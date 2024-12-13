import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/services/user_service.dart';

class GroupService {
  final CollectionReference _groupsCollection =
      FirebaseFirestore.instance.collection('groups');
  final UserService _userService = UserService();

  Stream<List<Group>> getGroups() {
    return _groupsCollection.snapshots().asyncMap((snapshot) async {
      // Create a list of futures to fetch user names
      List<Future<Group>> groupFutures = snapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String creatorId = data['creator']; // Get the creator ID

        // Fetch the creator's name using the UserService
        String? creatorName = await _userService.getUserNameById(creatorId);

        return Group(
          id: doc.id,
          invCode: data['invCode'],
          name: data['name'],
          creator:
              creatorName ?? creatorId, // Use creator name or fallback to ID
          date: List<String>.from(data['date'] ?? []),
          description: data['description'],
          members: data['members'],
        );
      }).toList();

      // Wait for all group futures to complete
      return await Future.wait(groupFutures);
    });
  }

  Future<void> addGroup(Group group) {
    return _groupsCollection.add({
      'name': group.name,
      'creator': group.creator,
      'invCode': group.invCode,
      'date': group.date,
      'description': group.description,
      'members': group.members,
    });
  }

  Future<void> updateGroup(Group group) {
    return _groupsCollection.doc(group.id).update({
      'name': group.name,
      'invCode': group.invCode,
      'date': group.date,
      'description': group.description,
      'members': group.members,
      'quizzes': group.quizzes
    });
  }

  Future<void> deleteGroup(String groupId) {
    return _groupsCollection.doc(groupId).delete();
  }

  Future<void> deleteAllGroups() async {
    QuerySnapshot snapshot = await _groupsCollection.get();
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
