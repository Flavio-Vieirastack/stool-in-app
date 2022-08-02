part of '../app_dialog.dart';

class _DialogError {
  Widget error({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 100,
          LottieConstants.lottieError,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(message)
      ],
    );
  }
}
