import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';

class AppMenuButton extends StatelessWidget {
  final String buttonName;
  final IconData? icon;
  final String? lottieAsset;
  final VoidCallback onPressed;
  const AppMenuButton({
    Key? key,
    required this.buttonName,
    this.icon,
    this.lottieAsset,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 6.h;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(30.dp)),
            onTap: onPressed,
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.dp),
                ),
              ),
              child: Center(
                child: icon != null
                    ? Icon(
                        icon,
                        color: AppColors.white,
                      )
                    : LottieBuilder.asset(lottieAsset!),
              ),
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            buttonName,
            style: AppTextStyles.headLine4,
          )
        ],
      ),
    );
  }
}
