part of '../app_dialog.dart';

class _DialogError {
  Widget error({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 100.w,
          LottieConstants.lottieError,
        ),
         SizedBox(
          height: 10.h,
        ),
        Text(message)
      ],
    );
  }
}
