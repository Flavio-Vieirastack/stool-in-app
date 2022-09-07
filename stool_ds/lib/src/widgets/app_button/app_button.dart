import 'package:flutter/material.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';
import '../app_progress_indicator/app_progress_indicator.dart';
import 'enum/button_types.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
part './button_types_widget.dart/disabled.dart';
part './button_types_widget.dart/loading.dart';
part './button_types_widget.dart/primary.dart';
part './button_types_widget.dart/secondary.dart';

class AppButton extends StatelessWidget {
  final ButtonTypes buttonTypes;
  final String buttonText;
  final VoidCallback? onPressed;
  const AppButton({
    this.buttonTypes = ButtonTypes.primary,
    required this.buttonText,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonTypes) {
      case ButtonTypes.primary:
        return _Primary(
          buttonText: buttonText,
          onPressed: onPressed ?? () {},
        );
      case ButtonTypes.secondary:
        return _Secondary(
          buttonText: buttonText,
          onPressed: onPressed ?? () {},
        );
      case ButtonTypes.disabled:
        return _Disabled(
          buttonText: buttonText,
        );
      case ButtonTypes.loading:
        return const _Loading();
    }
  }
}
