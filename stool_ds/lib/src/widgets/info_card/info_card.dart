import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';

class InfoCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String cardTitle;
  final Color? cardIconColor;
  const InfoCard({
    Key? key,
    required this.onPressed,
    required this.cardTitle,
    this.cardIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.dp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.dp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardTitle,
                style: AppTextStyles.headLine2,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: cardIconColor ?? AppColors.buttonRightGradientColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
