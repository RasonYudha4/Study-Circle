part of 'update_user_bloc.dart';

sealed class UpdateUserState extends Equatable {
  const UpdateUserState();

  @override
  List<Object> get props => [];
}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoadedState extends UpdateUserState {
  final User user;

  UpdateUserLoadedState({required this.user});
}

class UpdateUserErrorState extends UpdateUserState {
  final String error;

  UpdateUserErrorState({required this.error});
}
