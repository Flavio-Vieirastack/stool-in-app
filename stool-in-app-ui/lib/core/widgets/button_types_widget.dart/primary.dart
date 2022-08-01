part of '../app_button.dart';

class _Primary extends StatelessWidget with ResponsiveHelperMixin {
  final String buttonText;
  final VoidCallback onPressed;
  const _Primary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxWidth = 0.9;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth *
              responsiveWidth(
                defaultMobileWidth: maxWidth,
                defaultMobileSmallSizeWidth: 0.2,
                defaultTabletWidth: 0.2,
                constraints: constraints,
              ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5.0,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: [
                AppColors.buttonRightGradientColor,
                AppColors.buttonLeftGradientColor,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(const Size(50, 50)),
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
