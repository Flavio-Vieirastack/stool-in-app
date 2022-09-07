part of '../app_dialog.dart';

class _DialogInfo {
  Widget info({
    required VoidCallback yesOnPressed,
    required VoidCallback noOnPressed,
    required String yesButtonMessage,
    required String noButtonMessage,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DialogButton(
          onPressed: yesOnPressed,
          dialogButtonType: DialogButtonType.yes,
          buttonText: yesButtonMessage
        ),
        DialogButton(
          onPressed: noOnPressed,
          dialogButtonType: DialogButtonType.no,
          buttonText: noButtonMessage,
        )
      ],
    );
  }
}
