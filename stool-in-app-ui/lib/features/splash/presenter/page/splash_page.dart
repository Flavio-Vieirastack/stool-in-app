import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/constants/assets_constants.dart';

import '../../../../core/helpers/theme/colors/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaleDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(AssetsConstants.logoWhite),
          const Spacer(),
          const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
          const SizedBox(
             height: 100,
          ),
        ],
      ),
    );
  }
}
