import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_icon_button/enum/app_icon_button_type.dart';
part './icon_button_types.dart/error.dart';
part './icon_button_types.dart/sucess.dart';

class AppIconButton extends StatelessWidget {
  final AppIconButtonType appIconButtonType;
  final VoidCallback onPressed;
  const AppIconButton({
    Key? key,
    this.appIconButtonType = AppIconButtonType.sucess,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (appIconButtonType) {
      case AppIconButtonType.sucess:
        return _Sucess(
          onPressed: onPressed,
        );
      case AppIconButtonType.error:
        return _Error(
          onPressed: onPressed,
        );
    }
  }
}
