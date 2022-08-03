import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';

class AppTextFormField extends StatelessWidget with ResponsiveHelperMixin {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String label;
  final String hint;
  const AppTextFormField({
    Key? key,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.label = 'Label',
    this.hint = 'Hint',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth *
              responsiveWidth(
                defaultMobileWidth: 0.9,
                defaultMobileSmallSizeWidth: 0.5,
                defaultTabletWidth: 0.5,
                constraints: constraints,
              ),
          child: TextFormField(
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              fillColor: Colors.grey.withOpacity(0.7),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.buttonLeftGradientColor.withOpacity(0.5),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}