part of '../app_dialog.dart';
@immutable
class _DialogError {
  Widget error({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieError,
        ),
         SizedBox(
          height: 2.h,
        ),
        Text(message, style: AppTextStyles.headLine2,)
      ],
    );
  }
}
