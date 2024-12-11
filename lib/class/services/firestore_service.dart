import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_circle/class/models/group.dart';

class FirestoreService {
  final CollectionReference _groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  Stream<List<Group>> getGroups() {
    return _groupsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Group(
          id: doc.id,
          invCode: data['invCode'],
          name: data['name'],
          date: List<String>.from(data['date'] ?? []),
          description: data['description'],
        );
      }).toList();
    });
  }

  Future<void> addGroup(Group group) {
    return _groupsCollection.add({
      'name': group.name,
      'invCode': group.invCode,
      'date': group.date,
      'description': group.description,
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
