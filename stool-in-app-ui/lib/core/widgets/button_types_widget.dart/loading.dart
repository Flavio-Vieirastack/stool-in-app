part of '../app_button.dart';

class _Loading extends StatelessWidget with ResponsiveHelperMixin {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultMobileWidth = 0.74;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
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
            onPressed: () {},
            child: SizedBox(
              width: constraints.maxWidth *
                  responsiveWidth(
                    defaultMobileWidth: defaultMobileWidth,
                    defaultMobileSmallSizeWidth: 0.2,
                    defaultTabletWidth: 0.2,
                    constraints: constraints,
                  ),
              child: Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
