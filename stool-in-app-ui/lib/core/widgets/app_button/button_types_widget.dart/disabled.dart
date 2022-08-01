part of '../app_button.dart';

class _Disabled extends StatelessWidget with ResponsiveHelperMixin {
  final String buttonText;
  const _Disabled({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxWidth = 0.9;
    return IgnorePointer(
      ignoring: true,
      child: LayoutBuilder(
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
              color: AppColors.greyDisabled,
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
              child: Text(
                buttonText,
                style: AppTextStyles.headLine1,
              ),
            ),
          );
        },
      ),
    );
  }
}