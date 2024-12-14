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

  Future<User?> _fetchUpdatedUser(
      FetchUpdatedUserEvent event, Emitter<UpdateUserState> emit) async {
    try {
      final user = await _userService.getUserById(event.userId);
      emit(UpdateUserLoadedState(user: user!));
      print('Fetched user ${user}');
    } catch (e) {
      emit(UpdateUserErrorState(error: 'Failed to fetch username'));
    }
    return null;
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
