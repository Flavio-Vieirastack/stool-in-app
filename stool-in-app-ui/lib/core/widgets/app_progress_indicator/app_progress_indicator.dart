import 'package:flutter/material.dart';

import '../../helpers/theme/colors/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  final double? value;
  const AppProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      value: value,
      valueColor:
          AlwaysStoppedAnimation<Color>(AppColors.orange),
    );
  }
}
