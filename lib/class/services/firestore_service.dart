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
          name: data['name'],
          date: data['date'],
          description: data['description'],
        );
      }).toList();
    });
  }

  Future<void> addGroup(Group group) {
    return _groupsCollection.add({
      'name': group.name,
      'date': group.date,
      'description': group.description,
    });
  }

  Future<void> updateGroup(Group group) {
    return _groupsCollection.doc(group.id).update({
      'name': group.name,
      'date': group.date,
      'description': group.description,
    });
  }

  Future<void> deleteGroup(String groupId) {
    return _groupsCollection.doc(groupId).delete();
  }
}
