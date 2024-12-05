import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_event.dart';
part 'selected_state.dart';

class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {
  SelectedBloc() : super(SelectedInitial(tabIndex: 0)) {
    on<SelectJoined>(_onJoinedPressed);
    on<SelectConducted>(_onConductedPressed);
  }

  void _onJoinedPressed(SelectJoined event, Emitter<SelectedState> emit) {
    emit(SelectedInitial(tabIndex: 0));
  }

  void _onConductedPressed(SelectConducted event, Emitter<SelectedState> emit) {
    emit(SelectedInitial(tabIndex: 1));
  }
}
