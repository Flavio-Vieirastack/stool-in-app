part of '../app_dialog.dart';

class _DialogInfo {
  Widget info({
    required VoidCallback yesOnPressed,
    required VoidCallback noOnPressed,
  }) {
    return Column(
      children: [
        DialogButton(
          onPressed: yesOnPressed,
          dialogButtonType: DialogButtonType.yes,
          buttonText: 'Sim',
        ),
        DialogButton(
          onPressed: noOnPressed,
          dialogButtonType: DialogButtonType.no,
          buttonText: 'Não',
        )
      ],
    );
  }
}
