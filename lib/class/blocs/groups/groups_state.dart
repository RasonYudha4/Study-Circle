part of 'groups_bloc.dart';

sealed class GroupsState extends Equatable {
  const GroupsState();
  
  @override
  List<Object> get props => [];
}

final class GroupsInitial extends GroupsState {}
