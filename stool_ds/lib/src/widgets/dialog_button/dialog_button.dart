import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../theme/text_styles/app_text_styles.dart';

enum DialogButtonType {
  yes,
  no,
}
@immutable
class DialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  final DialogButtonType dialogButtonType;
  final String buttonText;
  const DialogButton({
    Key? key,
    required this.onPressed,
    required this.dialogButtonType,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: dialogButtonType == DialogButtonType.yes
            ? Colors.green
            : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.dp),
        ),
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.headLine2.copyWith(color: Colors.white),
      ),
    );
  }
}
