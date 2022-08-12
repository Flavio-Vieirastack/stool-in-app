part of '../app_dialog.dart';

class _DialogWaiting {
  Widget waiting({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 100.w,
          LottieConstants.lottieWaiting,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(message)
      ],
    );
  }
}
