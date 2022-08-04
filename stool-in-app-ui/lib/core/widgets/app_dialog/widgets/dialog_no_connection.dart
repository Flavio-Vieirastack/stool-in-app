part of '../app_dialog.dart';

class _DialogNoConnection {
  Widget noConnection(
      {required BuildContext context}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 150,
          LottieConstants.lottieNoConnection,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Ops! Você não tem conexão'),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: DialogButton(
            onPressed: () => DialogButtonInternetChecker().checkConnection(
              () => Navigator.of(context).pop(),
            ),
            dialogButtonType: DialogButtonType.yes,
            buttonText: 'Conectar',
          ),
        )
      ],
    );
  }
}
