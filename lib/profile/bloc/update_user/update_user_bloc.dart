import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_circle/profile/services/user_service.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UserService _userService;
  UpdateUserBloc({required UserService userService})
      : _userService = userService,
        super(UpdateUserInitial()) {
    on<UpdateUserNameEvent>(_updateUserName);
    on<FetchUpdatedUserEvent>(_fetchUpdatedUser);
  }

  Future<void> _fetchUpdatedUser(
      FetchUpdatedUserEvent event, Emitter<UpdateUserState> emit) async {
    try {
      final userData = await _userService.fetchUserById(event.userId);
      if (userData != null) {
        final user = User.fromJson(userData); // Convert Map to User
        emit(UpdateUserLoadedState(user: user)); // Emit loaded state with user
      } else {
        emit(UpdateUserErrorState(error: 'User  not found'));
      }
    } catch (e) {
      emit(UpdateUserErrorState(error: 'Failed to fetch user'));
    }
  }

  Future<void> _updateUserName(
      UpdateUserNameEvent event, Emitter<UpdateUserState> emit) async {
    try {
      await _userService.updateUserName(event.user);
      emit(UpdateUserLoadedState(user: event.user));
    } catch (e) {
      emit(UpdateUserErrorState(error: 'Failed to update user name'));
    }
  }
}
