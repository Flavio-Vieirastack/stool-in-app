part of '../app_dialog.dart';

class _DialogInfo {
  Widget info({
    required VoidCallback yesOnPressed,
    required VoidCallback noOnPressed,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: yesOnPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            fixedSize: const Size(150, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Sim',
            style: AppTextStyles.headLine2,
          ),
        ),
        ElevatedButton(
          onPressed: noOnPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            fixedSize: const Size(150, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Não',
            style: AppTextStyles.headLine2,
          ),
        ),
      ],
    );
  }
}
