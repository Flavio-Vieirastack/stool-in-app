import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../stool_in_core.dart';




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
