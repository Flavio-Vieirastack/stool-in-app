import 'package:flutter/material.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';

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

mixin AppSnackBar {
  showAppSnackbar({
    required String message,
    required BuildContext context,
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
                style: AppTextStyles.headLine4,
              ),
            ),
            Icon(
              getSnackBarIcon(type),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: getSnackBarColor(type),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}