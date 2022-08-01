import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stool_in_app_ui/core/colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle headLine1 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 18,
  );
  static TextStyle headLine2 = TextStyle(
    color: AppColors.black,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 17,
  );
  static TextStyle headLine3 = TextStyle(
    color: AppColors.black,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
  );
  static TextStyle headLine4 = TextStyle(
    color: AppColors.black,
    fontFamily: GoogleFonts.prata().fontFamily,
    fontSize: 14,
  );
}
