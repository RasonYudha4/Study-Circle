import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AppState(user: authenticationRepository.currentUser)) {
    on<AppUserSubscriptionRequested>(_onUserSubscriptionRequested);
    on<AppLogoutPressed>(_onLogoutPressed);
    on<HomeIconPressed>(_onHomeIconPressed);
    on<ClassIconPressed>(_onClassIconPressed);
    on<ProfileIconPressed>(_onProfileIconPressed);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onUserSubscriptionRequested(
    AppUserSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.user,
      onData: (user) => emit(AppState(user: user)),
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AppLogoutPressed event,
    Emitter<AppState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  void _onHomeIconPressed(
    HomeIconPressed event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(user: state.user, status: AppStatus.authenticatedHome));
  }

  void _onClassIconPressed(
    ClassIconPressed event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(user: state.user, status: AppStatus.authenticatedClass));
  }

  void _onProfileIconPressed(
    ProfileIconPressed event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(user: state.user, status: AppStatus.authenticatedProfile));
  }
}
