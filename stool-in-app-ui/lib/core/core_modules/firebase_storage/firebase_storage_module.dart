import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../module/export/module_export.dart';

class FirebaseStorageModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<FirebaseStorage>(
        create: (context) => FirebaseStorage.instance,
      ),
    ];
  }
}
