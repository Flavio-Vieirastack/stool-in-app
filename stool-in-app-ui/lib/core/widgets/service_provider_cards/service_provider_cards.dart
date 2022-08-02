import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/widgets/service_provider_cards/widget/service_provider_content.dart';

class ServiceProviderCards extends StatelessWidget {
  const ServiceProviderCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              colors: [
                AppColors.grey.withOpacity(0.2),
                AppColors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: const ServiceProviderContent(),
        ),
      ),
    );
  }
}
