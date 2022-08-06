import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle headLine0 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 32,
  );
  static TextStyle headLine1 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 18,
  );
  static TextStyle headLine1Gold = TextStyle(
    color: AppColors.buttonLeftGradientColor,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 18,
    decoration: TextDecoration.underline
  );
  static TextStyle headLine2 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 17,
  );
  static TextStyle headLine2UnderLine = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 17,
    decoration: TextDecoration.underline
  );
  static TextStyle headLine3 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
  );
  static TextStyle headLine4 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14,
  );
  static TextStyle headLine4Italic = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14,
    fontStyle: FontStyle.italic
  );
  static TextStyle headLine4Gray = TextStyle(
    color: AppColors.grey,
    fontFamily: GoogleFonts.prata().fontFamily,
    fontSize: 14,
  );
  static TextStyle headLine4Gold = TextStyle(
    color: AppColors.buttonLeftGradientColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14,
    decoration: TextDecoration.underline
  );
}
