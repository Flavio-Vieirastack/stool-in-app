import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
@immutable
class PermanentCubits {
  List<SingleChildWidget> cubits() {
    return [
      Provider(
        create: (context) => Object(),
      )
    ];
  }
}
