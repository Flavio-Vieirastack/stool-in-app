import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../helpers/pick_image_helper/pick_image_helper.dart';
import '../../../../helpers/storage_ref/user_storage_ref.dart';
import '../../../../module/main_module/inject.dart';
import '../../../../module/permanent_dependencies/permanent_cubit.dart';
import '../firebase_storage_cubit.dart';




class FirebaseStorageCubitModule implements PermanentCubit {
  @override
  List<SingleChildWidget> cubit() {
    return [
      Provider<FirebaseStorageCubit>(
        create: (context) => FirebaseStorageCubit(
          userStorageRef: Inject<UserStorageRef>(context).get(),
          firebaseStorage: Inject<FirebaseStorage>(context).get(),
          pickImageHelper: Inject<PickImageHelper>(context).get(),
        ),
      )
    ];
  }
}
