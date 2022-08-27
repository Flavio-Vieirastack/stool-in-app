import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../../exports/app_exports.dart';



class InternetConnectionCubitModule implements PermanentCubit {
  @override
  List<SingleChildWidget> cubit() {
    return [
      Provider(
        create: (context) => InternetConnectionCubit(),
      )
    ];
  }
}
