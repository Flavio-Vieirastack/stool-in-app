import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_logic/core/helpers/vote_ratting/vote_ratting_calculate.dart';
import 'package:stool_in_app_ui/core/module/permanent_dependencies/permanent_module.dart';

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
