part of 'landing_screen_bloc.dart';

abstract class LandingScreenState {
  final int tabIndex;

  const LandingScreenState({required this.tabIndex});
}

class LandingScreenInitial extends LandingScreenState {
  const LandingScreenInitial({required super.tabIndex});
}
