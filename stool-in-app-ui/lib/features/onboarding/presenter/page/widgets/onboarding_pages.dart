part of '../onboarding_page.dart';
@immutable
class OnboardingPages extends StatelessWidget {
  final String backgroundImageAsset;
  final String centerText;
  final bool showButton;
  final VoidCallback? onPressed;
  const OnboardingPages({
    Key? key,
    required this.backgroundImageAsset,
    required this.centerText,
    this.showButton = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    backgroundImageAsset,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops:  [0.0, 1.0],
                  colors: [
                    AppColors.pureBlack,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Image.asset(AssetsConstants.logoWhite),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: SizedBox(
                  width: 40.h,
                  child: Text(
                    centerText,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headLine1,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showButton,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 75.h),
                  child: AppButton(
                    buttonText: 'Eu quero',
                    onPressed: onPressed,
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
