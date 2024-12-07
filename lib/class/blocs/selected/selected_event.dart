part of 'selected_bloc.dart';

sealed class SelectedEvent extends Equatable {
  const SelectedEvent();

  @override
  List<Object> get props => [];
}

class SelectJoined extends SelectedEvent {
  const SelectJoined();
}

class SelectConducted extends SelectedEvent {
  const SelectConducted();
}
