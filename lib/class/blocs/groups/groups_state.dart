part of 'groups_bloc.dart';

sealed class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

final class GroupsInitial extends GroupsState {}

class GroupsLoading extends GroupsState {}

class GroupsLoaded extends GroupsState {
  final List<Group> groups;

  GroupsLoaded(this.groups);
}

class GroupsOperationSuccess extends GroupsState {
  final String message;

  GroupsOperationSuccess(this.message);
}

class GroupsError extends GroupsState {
  final String errorMessage;

  GroupsError(this.errorMessage);
}
