import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_cubit.dart';
import 'package:stool_in/core/shared/presenter/cubit/internet_connection_cubit/internet_connection_cubit.dart';

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
