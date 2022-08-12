part of '../app_dialog.dart';

class _DialogSucess {
  Widget sucess({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 100.w,
          LottieConstants.lottieSucess,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(message)
      ],
    );
  }
}
