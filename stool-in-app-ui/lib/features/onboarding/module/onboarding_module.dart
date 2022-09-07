import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../presenter/page/onboarding_page.dart';

@immutable
class OnboardingModule extends AppModule {
  OnboardingModule()
      : super(
          dependencies: [
            Provider<OnboardingCubit>(
              create: (context) => OnboardingCubit(),
            )
          ],
          routers: {
            RoutesConstants.onBoardingRoute: (context) => const OnboardingPage()
          },
        );
}
