import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/constants/assets_constants.dart';
import 'package:stool_in_app_ui/core/widgets/app_button.dart';
import 'package:stool_in_app_ui/core/widgets/enum/button_types.dart';

import '../../../../core/helpers/theme/colors/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaleDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // const Spacer(),
          // Image.asset(AssetsConstants.logoWhite),
          // const Spacer(),
          // const CircularProgressIndicator.adaptive(
          //   backgroundColor: Colors.white,
          // ),
          // const SizedBox(
          //    height: 100,
          // ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: AppButton(buttonTypes: ButtonTypes.primary),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: AppButton(buttonTypes: ButtonTypes.loading),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: AppButton(buttonTypes: ButtonTypes.secondary),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: AppButton(buttonTypes: ButtonTypes.disabled),
          ),
        ],
      ),
    );
  }
}
