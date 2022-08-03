import 'package:flutter/material.dart';

import '../../helpers/theme/colors/app_colors.dart';
import '../../helpers/theme/text_styles/app_text_styles.dart';
part './widgets/contracted_services_content.dart';
class ContractedServicesCard extends StatelessWidget {
  const ContractedServicesCard({Key? key}) : super(key: key);
  //! Esse e o card de serviços que o cliente agendou
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
