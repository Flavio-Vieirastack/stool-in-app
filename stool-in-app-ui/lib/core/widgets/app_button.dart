import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/widgets/button_types_widget.dart/disabled.dart';
import 'package:stool_in_app_ui/core/widgets/button_types_widget.dart/loading.dart';
import 'package:stool_in_app_ui/core/widgets/button_types_widget.dart/primary.dart';
import 'package:stool_in_app_ui/core/widgets/button_types_widget.dart/secondary.dart';
import 'package:stool_in_app_ui/core/widgets/enum/button_types.dart';

class AppButton extends StatelessWidget with ResponsiveHelperMixin {
  final ButtonTypes buttonTypes;
  const AppButton({
    required this.buttonTypes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonTypes) {
      case ButtonTypes.primary:
        return const Primary();
      case ButtonTypes.secondary:
        return const Secondary();
      case ButtonTypes.disabled:
        return const Disabled();
      case ButtonTypes.loading:
        return const Loading();
    }
  }
}
