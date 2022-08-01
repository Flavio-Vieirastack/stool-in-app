import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/widgets/enum/button_types.dart';

import '../helpers/theme/colors/app_colors.dart';
part './button_types_widget.dart/disabled.dart';
part './button_types_widget.dart/loading.dart';
part './button_types_widget.dart/primary.dart';
part './button_types_widget.dart/secondary.dart';
class AppButton extends StatelessWidget with ResponsiveHelperMixin {
  final ButtonTypes buttonTypes;
  const AppButton({
    this.buttonTypes = ButtonTypes.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonTypes) {
      case ButtonTypes.primary:
        return const _Primary();
      case ButtonTypes.secondary:
        return const _Secondary();
      case ButtonTypes.disabled:
        return const _Disabled();
      case ButtonTypes.loading:
        return const _Loading();
    }
  }
}
