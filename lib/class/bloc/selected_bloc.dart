import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_event.dart';
part 'selected_state.dart';

class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {
  SelectedBloc() : super(Joined()) {
    on<SelectJoined>(_onJoinedPressed);
    on<SelectConducted>(_onConductedPressed);
  }

  void _onJoinedPressed(SelectJoined event, Emitter<SelectedState> emit) {
    emit(Joined());
  }

  void _onConductedPressed(SelectConducted event, Emitter<SelectedState> emit) {
    emit(Conducted());
  }
}
