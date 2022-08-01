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
      OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingSecondImage,
        centerText:
            'Busque oportunidades para mostrar o seu trabalho para milhares de pessoas em sua região, ganhando aquela renda extra.',
      ),
      OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingLastImage,
        centerText:
            'Deseja contratar um profissional más não sabe onde encontra-lo? Ou deseja mostrar o seu talento e ainda ganhar aquele dinheiro extra?',
        showButton: true,
      ),
    ];
    return LiquidSwipe(
      pages: pages,
      enableSideReveal: true,
      slideIconWidget: const Icon(Icons.arrow_back_ios),
      waveType: WaveType.circularReveal,
      fullTransitionValue: 880,
      enableLoop: false,
      ignoreUserGestureWhileAnimating: true,
    );
  }
}
