import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/main_module/inject.dart';
import '../../../module/permanent_dependencies/permanent_module.dart';
import '../pick_image_helper.dart';



@immutable
class PickImageHelperModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<ImagePicker>(
        create: (context) => ImagePicker(),
      ),
      Provider<PickImageHelper>(
        create: (context) => PickImageHelper(
          imagePicker: Inject<ImagePicker>(context).get(),
        ),
      ),
    ];
  }
}
