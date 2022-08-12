part of '../app_button.dart';

class _Secondary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const _Secondary(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: Adaptive.w(90),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.greyScaleDark,
                offset: const Offset(0, 4),
                blurRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.circular(20.dp),
            border: Border.all(
              color: AppColors.textFormFieldBackgroundColor,
            ),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.dp),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(50.w, 50.h)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyles.headLine1,
            ),
          ),
        );
      },
    );
  }
}
