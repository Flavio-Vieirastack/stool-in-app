import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';

@immutable
class AppCategoryCard extends StatelessWidget {
  final String lottieUrl;
  final String categoryname;
  final VoidCallback onPressed;
  const AppCategoryCard({
    Key? key,
    required this.categoryname,
    required this.lottieUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
            child: Container(
              width: 33.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: AppColors.categoryCardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.dp),
                  topRight: Radius.circular(20.dp),
                ),
              ),
              child: LottieBuilder.network(
                lottieUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
              child: Container(
                height: 7.h,
                width: 33.w,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.dp),
                    bottomRight: Radius.circular(20.dp),
                  ),
                ),
                child: Center(
                  child: AutoSizeText(
                    categoryname,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    maxFontSize: 18,
                    minFontSize: 13,
                    style: AppTextStyles.headLine2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
