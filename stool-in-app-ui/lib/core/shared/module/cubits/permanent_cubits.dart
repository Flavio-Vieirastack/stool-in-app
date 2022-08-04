import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PermanentCubits {
  List<SingleChildWidget> cubits() {
    return [
      Provider(
        create: (context) => Object(),
      )
    ];
  }
}
