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
          width: Adaptive.w(85),
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.dp),
            border: Border.all(
              width: 2,
              color: AppColors.white,
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
