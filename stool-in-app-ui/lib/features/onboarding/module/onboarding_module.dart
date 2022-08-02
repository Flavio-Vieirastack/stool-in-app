import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/app_module.dart';
import 'package:stool_in_app_ui/features/onboarding/presenter/cubit/onboarding_cubit.dart';
import 'package:stool_in_app_ui/features/onboarding/presenter/page/onboarding_page.dart';

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
