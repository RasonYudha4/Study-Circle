part of 'app_bloc.dart';

enum AppStatus {
  authenticatedHome,
  authenticatedProfile,
  authenticatedClass,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState({User user = User.empty, AppStatus? status})
      : this._(
          status: user == User.empty
              ? AppStatus.unauthenticated
              : status ??
                  AppStatus.authenticatedHome, // Default page status to Home
          user: user,
        );

  const AppState._({required this.status, this.user = User.empty});

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
