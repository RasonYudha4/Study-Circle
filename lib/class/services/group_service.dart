import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/services/user_service.dart';

class GroupService {
  final CollectionReference _groupsCollection =
      FirebaseFirestore.instance.collection('groups');
  final UserService _userService = UserService();

  Stream<List<Group>> getGroups() {
    return _groupsCollection.snapshots().asyncMap((snapshot) async {
      List<Future<Group>> groupFutures = snapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String creatorId = data['creator'];

        String? creatorName = await _userService.getUserNameById(creatorId);

        return Group(
          id: doc.id,
          invCode: data['invCode'],
          name: data['name'],
          creator: creatorName ?? creatorId,
          date: List<String>.from(data['date'] ?? []),
          description: data['description'],
          members: (data['members'] as List<dynamic>?)
                  ?.map((e) => e != null ? e as String : '')
                  .toList() ??
              [],
        );
      }).toList();

      return await Future.wait(groupFutures);
    });
  }

  Future<List<Group>> getConductedGroups(String creator) async {
    QuerySnapshot querySnapshot =
        await _groupsCollection.where("creator", isEqualTo: creator).get();
    print("Searching for groups with creator: $creator");
    if (querySnapshot.docs.isNotEmpty) {
      List<Group> groups = [];

      for (var doc in querySnapshot.docs) {
        var groupsData = doc.data() as Map<String, dynamic>;
        String documentId = doc.id;

        print('Group Id : $documentId');
        print('Group Data: $groupsData');

        groups.add(Group.fromMap(groupsData, id: documentId));
      }

      return groups;
    } else {
      print('Group with creator Id : ${creator} does not exist');
    }

    return [];
  }

  Future<List<Group>> getJoinedGroups(String memberId) async {
    QuerySnapshot querySnapshot =
        await _groupsCollection.where("members", arrayContains: memberId).get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Group> groups = [];

      List<Future<void>> groupFutures = querySnapshot.docs.map((doc) async {
        var groupsData = doc.data() as Map<String, dynamic>;
        String creatorId = groupsData['creator'];
        String documentId = doc.id;

        String? creatorName = await _userService.getUserNameById(creatorId);

        print('Group Id : $documentId');
        print('Group Data: $groupsData');

        groups.add(Group(
          id: documentId,
          invCode: groupsData['invCode'],
          name: groupsData['name'],
          creator: creatorName ?? creatorId,
          date: List<String>.from(groupsData['date'] ?? []),
          description: groupsData['description'],
          members: (groupsData['members'] as List<dynamic>?)
                  ?.map((e) => e != null ? e as String : '')
                  .toList() ??
              [],
        ));
      }).toList();

      await Future.wait(groupFutures);

      return groups;
    } else {
      print('User  with Id : ${memberId} has not joined any group yet');
    }

    return [];
  }

  Future<Group?> getGroupByInvCode(String invCode) async {
    QuerySnapshot querySnapshot =
        await _groupsCollection.where("invCode", isEqualTo: invCode).get();
    if (querySnapshot.docs.isNotEmpty) {
      var groupData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      String documentId = querySnapshot.docs.first.id;
      print('Group Id : $documentId');
      print('Group Data: $groupData');
      return Group.fromMap(groupData, id: documentId);
    } else {
      print('No group found with invCode: ${invCode}');
    }
    return null;
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

  Future<void> joinGroup(Group group) async {
    QuerySnapshot querySnapshot = await _groupsCollection
        .where("invCode", isEqualTo: group.invCode)
        .get();
    print('New Member Id: ${group.newMemberId}');
    return _groupsCollection.doc(querySnapshot.docs.first.id).update({
      'members': FieldValue.arrayUnion([group.newMemberId])
    });
  }

  Future<void> updateGroup(Group group) {
    return _groupsCollection.doc(group.id).update({
      'name': group.name,
      'invCode': group.invCode,
      'date': group.date,
      'description': group.description,
      'quizzes': group.quizzes,
      'newMemberId': group.newMemberId,
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
