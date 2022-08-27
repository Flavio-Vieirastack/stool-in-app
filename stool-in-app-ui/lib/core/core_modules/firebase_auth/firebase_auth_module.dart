import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../exports/app_exports.dart';



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
