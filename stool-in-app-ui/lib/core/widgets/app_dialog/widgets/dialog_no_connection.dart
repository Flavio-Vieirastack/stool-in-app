part of '../app_dialog.dart';

class _DialogNoConnection {
  Widget noConnection({required BuildContext context}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 150.w,
          LottieConstants.lottieNoConnection,
        ),
        SizedBox(
          height: 10.h,
        ),
        const Text('Você não tem conexão'),
        SizedBox(
          height: 10.h,
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
