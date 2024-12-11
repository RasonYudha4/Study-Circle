part of 'groups_bloc.dart';

sealed class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class DeleteAllGroups extends GroupsEvent {}

class LoadGroups extends GroupsEvent {}

class AddGroups extends GroupsEvent {
  final Group group;

  AddGroups(this.group);
}

class UpdateGroup extends GroupsEvent {
  final Group group;

  UpdateGroup(this.group);
}

class DeleteGroup extends GroupsEvent {
  final String groupId;

  DeleteGroup(this.groupId);
}
