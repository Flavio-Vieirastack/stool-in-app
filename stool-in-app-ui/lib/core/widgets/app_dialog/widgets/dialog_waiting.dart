part of '../app_dialog.dart';

class _DialogWaiting {
  Widget waiting({
    required String message,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieWaiting,
        ),
        Text(
          message,
          style: AppTextStyles.headLine2,
        ),
        SizedBox(
          height: 2.h,
        ),
        DialogButton(
          onPressed: onPressed,
          dialogButtonType: DialogButtonType.yes,
          buttonText: 'Confirmei meu email',
        ),
      ],
    );
  }
}
