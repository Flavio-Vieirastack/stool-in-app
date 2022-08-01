import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stool_in_app_ui/features/onboarding/presenter/page/widgets/onboarding_pages.dart';

import '../../../../core/constants/assets_constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingFirstImage,
        centerText:
            'Contrate os melhores profissionais para realizar os mais variados tipos de serviços, sem precisar sair do conforto da sua casa.',
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,
      ),
    ];
    return LiquidSwipe(
      pages: pages,
      enableSideReveal: true,
      slideIconWidget: const Icon(Icons.arrow_back_ios),
      waveType: WaveType.liquidReveal,
      fullTransitionValue: 880,
      enableLoop: false,
      ignoreUserGestureWhileAnimating: true,
    );
  }
}
