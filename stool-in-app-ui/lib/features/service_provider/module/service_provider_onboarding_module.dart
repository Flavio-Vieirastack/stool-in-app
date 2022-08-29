import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/service_provider/presenter/page/onboarding/service_provider_onboarding_page.dart';

class ServiceProviderOnboardingModule extends AppModule {
  ServiceProviderOnboardingModule()
      : super(
          routers: {
            RoutesConstants.serviceProviderOnboardingRoute: (context) =>
                const ServiceProviderOnboardingPage()
          },
        );
}
