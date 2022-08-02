part of '../app_dialog.dart';

class _DialogSucess {
  Widget sucess({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 100,
          LottieConstants.lottieSucess,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(message)
      ],
    );
  }
}
