part of 'image_picker_bloc.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class InsertImagePickerEvent extends ImagePickerEvent {
  final String userId;
  final Uint8List image;

  InsertImagePickerEvent({required this.userId, required this.image});
}

class GetImageByUserIdEvent extends ImagePickerEvent {
  final String userId;

  GetImageByUserIdEvent({required this.userId});
}

class UpdateImageByUserIdEvent extends ImagePickerEvent {
  final String userId;
  final Uint8List image;

  UpdateImageByUserIdEvent({required this.userId, required this.image});
}
