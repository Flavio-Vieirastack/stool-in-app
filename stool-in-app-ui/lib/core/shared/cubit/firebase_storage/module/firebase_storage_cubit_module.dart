import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/helpers/pick_image_helper/pick_image_helper.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_cubit.dart';
import 'package:stool_in/core/shared/cubit/firebase_storage/firebase_storage_cubit.dart';

class FirebaseStorageCubitModule implements PermanentCubit {
  @override
  List<SingleChildWidget> cubit() {
    return [
      Provider<FirebaseStorageCubit>(
        create: (context) => FirebaseStorageCubit(
          firebaseStorage: Inject<FirebaseStorage>(context).get(),
          pickImageHelper: Inject<PickImageHelper>(context).get(),
        ),
      )
    ];
  }
}
