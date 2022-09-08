part of '../app_dialog.dart';
@immutable
class _DialogSucess {
  Widget sucess({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieSucess,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          message,
          style: AppTextStyles.headLine2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
