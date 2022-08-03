import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_scheduling_card/widget/shceduling_content.dart';

import '../../helpers/theme/colors/app_colors.dart';

class AppSchedulingCard extends StatelessWidget {
  const AppSchedulingCard({Key? key}) : super(key: key);
  // Esse card vai ser usado para o prestador de serviço ver os serviços que ele tem que executar
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonRightGradientColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: RadialGradient(
          radius: 2,
          colors: [
            AppColors.grey.withOpacity(0.5),
            AppColors.black.withOpacity(0.2),
          ],
        ),
      ),
      child: const ShcedulingContent(),
    );
  }
}
