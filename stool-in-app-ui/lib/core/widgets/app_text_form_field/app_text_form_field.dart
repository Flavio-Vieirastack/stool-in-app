import 'package:flutter/material.dart';
import 'package:stool_in/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
class AppTextFormField extends StatelessWidget with ResponsiveHelperMixin {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool expands;
  final String label;
  final String hint;
  final Color? color;
  const AppTextFormField({
    Key? key,
    this.validator,
    this.obscureText = false,
    this.expands = false,
    this.controller,
    this.label = 'Label',
    this.hint = 'Hint',
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: Adaptive.w(85),
          child: TextFormField(
            expands: expands,
            maxLines: expands ? null : 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              labelStyle: AppTextStyles.headLine4,
              hintStyle: AppTextStyles.headLine4Gray,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.dp),
                ),
              ),
              fillColor: color ?? Colors.grey.withOpacity(0.7),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.dp),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.buttonLeftGradientColor.withOpacity(0.5),
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.dp),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
