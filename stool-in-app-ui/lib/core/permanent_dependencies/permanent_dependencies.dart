import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PermanentDependencies {
  static List<SingleChildWidget> init() {
    final providers = [
      Provider(
        create: (_) => Object(),
      ),
    ];
    return providers;
  }
}