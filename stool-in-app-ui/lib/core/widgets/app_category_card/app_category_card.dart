import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';
import 'dart:math' as math;

class AppCategoryCard extends StatelessWidget {
  const AppCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.repeated,
              colors: [
                AppColors.black.withOpacity(0.5),
                 Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.2),
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.0.dp),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                LottieBuilder.network(
                  'https://assets5.lottiefiles.com/packages/lf20_7ifso9nc.json',
                  width: 30.w,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                  width: 33.w,
                  child: Center(
                    child: Text(
                      'Lavagem de carro',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headLine4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
