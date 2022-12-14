import 'package:flutter/material.dart';

import '../../theme/colors/app_colors.dart';

@immutable
class AppProgressIndicator extends StatelessWidget {
  final double? value;
  const AppProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      value: value,
      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.orange),
    );
  }
}
