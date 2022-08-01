part of '../app_button.dart';

class _Secondary extends StatelessWidget with ResponsiveHelperMixin {
  const _Secondary({Key? key}) : super(key: key);

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
            boxShadow: [
              BoxShadow(
                color: AppColors.greyScaleDark,
                offset: const Offset(0, 4),
                blurRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.buttonLeftGradientColor,
            ),
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
              // elevation: MaterialStateProperty.all(3),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              'secondary',
              style: AppTextStyles.headLine1,
            ),
          ),
        );
      },
    );
  }
}
