import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/helpers/pick_image_helper/pick_image_helper.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

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
