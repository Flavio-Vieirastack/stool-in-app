import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';

class AppMenuButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final VoidCallback onPressed;
  const AppMenuButton({
    Key? key,
    required this.buttonName,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 6.h;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        child: Column(
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: AppColors.buttonRightGradientColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.dp),
                ),
              ),
              child: Center(
                child: Icon(icon)
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
             Text(buttonName)
          ],
        ),
      ),
    );
  }
}
