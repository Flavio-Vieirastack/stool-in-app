import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/helpers/vote_ratting/vote_ratting_calculate.dart';
@immutable
class VoteRattingModule {
  List<SingleChildWidget> voteInject() {
    return [
      Provider(
        create: (context) => VoteRattingCalculate(),
      )
    ];
  }
}
