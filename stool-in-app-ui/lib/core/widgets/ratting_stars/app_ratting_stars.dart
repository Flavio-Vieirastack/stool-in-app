import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AppRattingStars extends StatelessWidget {
  final double value;
  final double size;
  final bool valueVisible;
  final dynamic Function(double)? onValueChanged;
  const AppRattingStars({
    Key? key,
    required this.value,
    required this.onValueChanged,
    this.size = 40,
    this.valueVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: onValueChanged,
      starCount: 5,
      starSize: size.dp,
      valueLabelColor: const Color(0xff9b9b9b),
      valueLabelTextStyle: AppTextStyles.headLine3,
      valueLabelRadius: 10.dp,
      maxValue: 5,
      starSpacing: 1.w,
      maxValueVisibility: valueVisible,
      valueLabelVisibility: valueVisible,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.h),
      valueLabelMargin: EdgeInsets.only(right: 8.w),
      starOffColor: const Color(0xffe7e8ea),
      starColor: const Color.fromARGB(219, 255, 235, 59),
    );
  }
}
