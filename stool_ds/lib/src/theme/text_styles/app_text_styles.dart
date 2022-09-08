import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../colors/app_colors.dart';

@immutable
class AppTextStyles {
  const AppTextStyles._();
  static TextStyle headLine0 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 32.dp,
  );
  static TextStyle headLine0Gold = TextStyle(
    color: AppColors.buttonLeftGradientColor,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 32.dp,
  );
  static TextStyle headLine1 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 20.dp,
  );
  static TextStyle headLine1Gold = TextStyle(
      color: AppColors.buttonLeftGradientColor,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.exo2().fontFamily,
      fontSize: 18.dp,
      decoration: TextDecoration.underline);
  static TextStyle headLine2 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.exo2().fontFamily,
    fontSize: 18.dp,
  );
  static TextStyle headLine2UnderLine = TextStyle(
      color: AppColors.white,
      fontFamily: GoogleFonts.exo2().fontFamily,
      fontSize: 17.dp,
      decoration: TextDecoration.underline);
  static TextStyle headLine3 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16.dp,
  );
  static TextStyle headLine3Gold = TextStyle(
    color: AppColors.buttonRightGradientColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    fontSize: 16.dp,
  );
  static TextStyle headLine3White = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14.dp,
  );
  static TextStyle headLine4 = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 15.dp,
  );
  static TextStyle headLine4Blue = TextStyle(
    color: AppColors.linkTextColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 15.dp,
  );
  static TextStyle headLine4Green = TextStyle(
    color: Colors.green,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14.dp,
  );
  static TextStyle headLine4Black = TextStyle(
    color: AppColors.black,
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14.dp,
  );
  static TextStyle headLine4Italic = TextStyle(
      color: AppColors.white,
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontSize: 14.dp,
      fontStyle: FontStyle.italic);
  static TextStyle headLine4Gray = TextStyle(
    color: AppColors.grey,
    fontFamily: GoogleFonts.prata().fontFamily,
    fontSize: 14.dp,
  );
  static TextStyle headLine4Small = TextStyle(
    color: AppColors.white,
    fontFamily: GoogleFonts.prata().fontFamily,
    fontSize: 11.dp,
  );
  static TextStyle headLine4Gold = TextStyle(
      color: AppColors.buttonLeftGradientColor,
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontSize: 14.dp,
      decoration: TextDecoration.underline);
}
