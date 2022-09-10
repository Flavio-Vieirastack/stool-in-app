part of '../app_button.dart';

@immutable
class _Primary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;
  const _Primary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: Adaptive.w(85),
          height: 6.h,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5.0,
              )
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                AppColors.buttonRightGradientColor,
                AppColors.buttonLeftGradientColor,
              ],
            ),
            borderRadius: BorderRadius.circular(20.dp),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.dp),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(50.w, 50.h)),
              backgroundColor:
                  MaterialStateProperty.all(color ?? Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyles.headLine1.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
