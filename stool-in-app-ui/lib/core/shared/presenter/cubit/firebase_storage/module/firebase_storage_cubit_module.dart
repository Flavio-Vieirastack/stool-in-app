import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../../exports/app_exports.dart';



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
