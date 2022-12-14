import 'dart:developer';

import 'package:image_picker/image_picker.dart';

enum ImageFrom {
  camera,
  gallery,
}

class PickImageHelper {
  final ImagePicker _imagePicker;
  PickImageHelper({
    required ImagePicker imagePicker,
  }) : _imagePicker = imagePicker;
  Future<XFile?> getImage({required ImageFrom imageFrom}) async {
    if (imageFrom == ImageFrom.camera) {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      return image;
    } else {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      log(image?.path ?? 'Sem imagem');
      return image;
    }
  }
}
