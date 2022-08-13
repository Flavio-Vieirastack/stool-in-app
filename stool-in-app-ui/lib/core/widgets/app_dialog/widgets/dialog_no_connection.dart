part of '../app_dialog.dart';

class _DialogNoConnection {
  Widget noConnection({required BuildContext context}) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieNoConnection,
        ),
        SizedBox(
          height: 2.h,
        ),
        const Text('Você não tem conexão'),
        SizedBox(
          height: 2.h,
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
