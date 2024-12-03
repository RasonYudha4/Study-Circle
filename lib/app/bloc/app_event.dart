part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppUserSubscriptionRequested extends AppEvent {
  const AppUserSubscriptionRequested();
}

final class AppLogoutPressed extends AppEvent {
  const AppLogoutPressed();
}

final class HomeIconPressed extends AppEvent {
  const HomeIconPressed();
}

final class ClassIconPressed extends AppEvent {
  const ClassIconPressed();
}

final class ProfileIconPressed extends AppEvent {
  const ProfileIconPressed();
}
