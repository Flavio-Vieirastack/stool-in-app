import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../theme/text_styles/app_text_styles.dart';
enum SnackBarType {
  success,
  error,
}

Color getSnackBarColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Colors.green.shade400;
    case SnackBarType.error:
      return Colors.red.shade400;
  }
}

IconData getSnackBarIcon(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Icons.check;
    case SnackBarType.error:
      return Icons.error;
  }
}
@immutable
mixin AppSnackBar {
  showAppSnackbar({
    required String message,
    required BuildContext context,
    int duration = 3,
    SnackBarType type = SnackBarType.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.headLine4.copyWith(color: Colors.white),
              ),
            ),
            Icon(
              getSnackBarIcon(type),
              color: Colors.white,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.dp),
        ),
        backgroundColor: getSnackBarColor(type),
        duration: Duration(seconds: duration),
      ),
    );
  }
}