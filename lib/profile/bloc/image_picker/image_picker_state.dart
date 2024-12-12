part of 'image_picker_bloc.dart';

sealed class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

final class ImagePickerInitial extends ImagePickerState {}

class ImageInitialState extends ImagePickerState {}

class ImageLoadedState extends ImagePickerState {
  final Uint8List image;

  ImageLoadedState({required this.image});
}

class ImageErrorState extends ImagePickerState {
  final String error;

  ImageErrorState({required this.error});
}
