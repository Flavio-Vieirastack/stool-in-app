import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../helpers/export/helpers_export.dart';
import '../../../../../module/export/module_export.dart';
import '../../../../export/shared_export.dart';


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
