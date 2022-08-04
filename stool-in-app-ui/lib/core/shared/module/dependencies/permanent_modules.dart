import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      Provider(
        create: (context) => Object(),
      )
    ];
  }
}
