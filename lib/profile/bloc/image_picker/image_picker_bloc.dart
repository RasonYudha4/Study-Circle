import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_circle/profile/repository/image_repository.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImageRepository _databaseHelper;
  ImagePickerBloc({required ImageRepository databaseHelper})
      : _databaseHelper = databaseHelper,
        super(ImageInitialState()) {
    on<InsertImagePickerEvent>(_insertImage);
    on<GetImageByUserIdEvent>(_getImageByUserId);
    on<UpdateImageByUserIdEvent>(_updateImageByUserId);
  }

  Future<void> _insertImage(
      InsertImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    try {
      await _databaseHelper.insertImage(event.image, event.userId);
      emit(ImageLoadedState(image: event.image));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
    }
  }

  Future<void> _getImageByUserId(
      GetImageByUserIdEvent event, Emitter<ImagePickerState> emit) async {
    try {
      final image = await _databaseHelper.getImageByUserId(event.userId);
      if (image != null) {
        emit(ImageLoadedState(image: image));
      } else {
        emit(ImageErrorState(error: 'Image not found'));
      }
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
    }
  }

  Future<void> _updateImageByUserId(
      UpdateImageByUserIdEvent event, Emitter<ImagePickerState> emit) async {
    try {
      await _databaseHelper.updateImageByUserId(event.userId, event.image);
      emit(ImageLoadedState(image: event.image));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
    }
  }
}
