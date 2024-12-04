import 'package:bloc/bloc.dart';

part 'landing_screen_event.dart';
part 'landing_screen_state.dart';

class LandingScreenBloc extends Bloc<LandingScreenEvent, LandingScreenState> {
  LandingScreenBloc() : super(const LandingScreenInitial(tabIndex: 0)) {
    on<LandingScreenEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(LandingScreenInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
