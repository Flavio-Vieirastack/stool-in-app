import 'package:flutter/material.dart';

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
                style: const TextStyle(
                  color: Colors.white,
                ),
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