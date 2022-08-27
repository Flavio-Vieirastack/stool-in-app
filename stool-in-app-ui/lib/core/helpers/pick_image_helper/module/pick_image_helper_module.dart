import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../exports/app_exports.dart';


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
