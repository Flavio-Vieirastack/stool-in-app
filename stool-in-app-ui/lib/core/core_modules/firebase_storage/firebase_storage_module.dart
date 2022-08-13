import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

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
