part of 'groups_bloc.dart';

sealed class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class DeleteAllGroups extends GroupsEvent {}

class LoadGroups extends GroupsEvent {}

class GetGroupByInvCode extends GroupsEvent {
  final Group group;

  GetGroupByInvCode(this.group);
}

class GetGroupById extends GroupsEvent {
  final String id;

  GetGroupById(this.id);
}

class AddGroups extends GroupsEvent {
  final Group group;

  AddGroups(this.group);
}

class UpdateGroup extends GroupsEvent {
  final Group group;

  UpdateGroup(this.group);
}

class JoinedGroup extends GroupsEvent {
  final Group group;

  JoinedGroup(this.group);
}

class GetJoinedGroups extends GroupsEvent {
  final String memberId;

  GetJoinedGroups(this.memberId);
}

class GetConductedGroups extends GroupsEvent {
  final String creator;

  GetConductedGroups(this.creator);
}

class DeleteGroup extends GroupsEvent {
  final String groupId;

  DeleteGroup(this.groupId);

  @override
  List<Object> get props => [groupId];
}
