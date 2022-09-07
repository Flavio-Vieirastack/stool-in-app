import 'package:flutter/material.dart';
import 'package:stool_in/features/service_provider/presenter/page/onboarding/service_provider_onboarding_page.dart';
import 'package:stool_in_core/stool_in_core.dart';
@immutable
class ServiceProviderOnboardingModule extends AppModule {
  ServiceProviderOnboardingModule()
      : super(
          routers: {
            RoutesConstants.serviceProviderOnboardingRoute: (context) =>
                const ServiceProviderOnboardingPage()
          },
        );
}
