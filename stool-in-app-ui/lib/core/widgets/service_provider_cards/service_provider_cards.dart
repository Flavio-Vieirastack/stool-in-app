import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/widgets/service_provider_cards/widget/service_provider_content.dart';

class ServiceProviderCards extends StatelessWidget {
  const ServiceProviderCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.buttonLeftGradientColor.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: RadialGradient(
            radius: 2,
            colors: [
              AppColors.grey.withOpacity(0.5),
              AppColors.black.withOpacity(0.3),
            ],
          ),
        ),
        child: const ServiceProviderContent(),
      ),
    );
  }
}
