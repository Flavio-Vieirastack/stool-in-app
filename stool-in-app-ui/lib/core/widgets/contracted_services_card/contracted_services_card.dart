import 'package:flutter/material.dart';

import '../../helpers/theme/colors/app_colors.dart';
part './widgets/contracted_services_content.dart';
class ContractedServicesCard extends StatelessWidget {
  const ContractedServicesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const _ContractedServicesContent(),
    );
  }
}
