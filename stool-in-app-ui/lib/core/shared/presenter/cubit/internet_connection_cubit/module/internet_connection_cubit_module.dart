import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../module/export/module_export.dart';
import '../../../../export/shared_export.dart';


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
