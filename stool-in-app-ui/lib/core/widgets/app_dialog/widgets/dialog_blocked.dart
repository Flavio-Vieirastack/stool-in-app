part of '../app_dialog.dart';
class _DialogBlocked {
  Widget blocked({required String message}) {
    return  Column(
      children: [
        LottieBuilder.asset(
          width: 100.w,
          LottieConstants.lottieBlcoked,
        ),
         SizedBox(
          height: 10.h,
        ),
        Text(message)
      ],
    );
  }
}