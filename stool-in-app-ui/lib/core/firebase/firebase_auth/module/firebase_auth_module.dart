import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/permanent_dependencies/permanent_module.dart';

class FirebaseAuthModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider(
        create: (context) => FirebaseAuth.instance,
      )
    ];
  }
}
