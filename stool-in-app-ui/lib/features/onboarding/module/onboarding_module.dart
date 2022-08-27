import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../exports/app_exports.dart';

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
