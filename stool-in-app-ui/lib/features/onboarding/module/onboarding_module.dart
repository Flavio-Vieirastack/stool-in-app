import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/export/constants_export.dart';
import '../../../core/module/export/module_export.dart';
import '../export/onboarding_export.dart';

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
