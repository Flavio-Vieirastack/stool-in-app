part of '../app_dialog.dart';
class _DialogBlocked {
  Widget blocked({required String message}) {
    return  Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieBlcoked,
        ),
         SizedBox(
          height: 2.h,
        ),
        Text(message, style: AppTextStyles.headLine2,)
      ],
    );
  }
}