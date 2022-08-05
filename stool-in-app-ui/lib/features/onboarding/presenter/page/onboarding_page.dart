import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';
import 'package:stool_in_app_ui/features/onboarding/presenter/cubit/onboarding_cubit.dart';
import 'package:stool_in_app_ui/features/onboarding/presenter/page/widgets/onboarding_pages.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final pages = [
      const OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingFirstImage,
        centerText:
            'Contrate os melhores profissionais para realizar os mais variados tipos de serviços, sem precisar sair do conforto da sua casa.',
      ),
      const OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingSecondImage,
        centerText:
            'Busque oportunidades para mostrar o seu trabalho para milhares de pessoas em sua região, ganhando aquela renda extra.',
      ),
      OnboardingPages(
        backgroundImageAsset: AssetsConstants.onboardingLastImage,
        centerText:
            'Deseja contratar um profissional más não sabe onde encontra-lo? Ou deseja mostrar o seu talento e ainda ganhar aquele dinheiro extra?',
        showButton: true,
        onPressed: () => cubit.gotToLoginPageAndSaveOnBoardingFlow(),
      ),
    ];
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnBoardingGoToLoginPage) {
          Navigator.of(context).pushReplacementNamed(
            RoutesConstants.loginRoute,
          );
        }
      },
      child: LiquidSwipe(
        pages: pages,
        enableSideReveal: true,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios,
        ),
        waveType: WaveType.circularReveal,
        fullTransitionValue: 880,
        enableLoop: false,
        ignoreUserGestureWhileAnimating: true,
      ),
    );
  }
}
