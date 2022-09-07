import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/permanent_dependencies/permanent_module.dart';
import '../vote_ratting_calculate.dart';




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
