import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/constants/assets_constants.dart';
import 'package:stool_in_app_logic/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_button/app_button.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';

class OnboardingPages extends StatelessWidget with ResponsiveHelperMixin {
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 1.0],
                  colors: [
                    AppColors.black,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Image.asset(AssetsConstants.logoWhite),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: SizedBox(
                  width: constraints.maxWidth *
                      responsiveWidth(
                        defaultMobileWidth: 0.8,
                        defaultMobileSmallSizeWidth: 0.8,
                        defaultTabletWidth: 0.8,
                        constraints: constraints,
                      ),
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
                  padding: const EdgeInsets.only(top: 650),
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
