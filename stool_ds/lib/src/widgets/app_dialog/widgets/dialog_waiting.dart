part of '../app_dialog.dart';
@immutable
class _DialogWaiting {
  Widget waiting({
    required String message,
    required VoidCallback yesOnPressed,
    required VoidCallback noOnpressed,
  }) {
    return Column(
      children: [
        LottieBuilder.asset(
          width: 50.w,
          LottieConstants.lottieWaiting,
        ),
        Text(
          message,
          style: AppTextStyles.headLine2,
        ),
        SizedBox(
          height: 2.h,
        ),
        DialogButton(
          onPressed: yesOnPressed,
          dialogButtonType: DialogButtonType.yes,
          buttonText: 'Confirmei meu email',
        ),
        DialogButton(
          onPressed: noOnpressed,
          dialogButtonType: DialogButtonType.no,
          buttonText: 'Não recebi o email',
        ),
      ],
    );
  }
}
