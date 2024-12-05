part of 'selected_bloc.dart';

sealed class SelectedState {
  final int tabIndex;

  const SelectedState({required this.tabIndex});
}

class SelectedInitial extends SelectedState {
  const SelectedInitial({required super.tabIndex});
}
