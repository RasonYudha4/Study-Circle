part of 'update_user_bloc.dart';

sealed class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserNameEvent extends UpdateUserEvent {
  final User user;

  UpdateUserNameEvent({required this.user});
}

class FetchUpdatedUserEvent extends UpdateUserEvent {
  final String userId;

  FetchUpdatedUserEvent({required this.userId});
}
