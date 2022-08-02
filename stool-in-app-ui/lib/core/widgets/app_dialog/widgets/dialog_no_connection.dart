part of '../app_dialog.dart';

class _DialogNoConnection {
  Widget noConnection({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 150,
          LottieConstants.lottieNoConnection,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(message)
      ],
    );
  }
}
