import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/export/module_export.dart';
import '../../export/helpers_export.dart';


@immutable
class VoteRattingModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider(
        create: (context) => VoteRattingCalculate(),
      )
    ];
  }
}
