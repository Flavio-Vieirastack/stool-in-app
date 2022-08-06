part of '../login_page.dart';

class _LoginCard extends StatelessWidget with ResponsiveHelperMixin {
  final BoxConstraints constraints;
  const _LoginCard({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight *
          responsiveHeight(
            defaultMobileHeight: 0.5,
            defaultMobileSmallSizeHeight: 0.5,
            defaultTabletHeight: 0.5,
            constraints: constraints,
          ),
      width: constraints.maxWidth *
          responsiveWidth(
            defaultMobileWidth: 0.9,
            defaultMobileSmallSizeWidth: 0.8,
            defaultTabletWidth: 0.8,
            constraints: constraints,
          ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}
