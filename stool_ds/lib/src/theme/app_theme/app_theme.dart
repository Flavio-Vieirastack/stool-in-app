import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
@immutable
class AppTheme {
  const AppTheme._();
  static get title => 'StoolIn';
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.buttonRightGradientColor,
        primaryColorDark: AppColors.buttonRightGradientColor,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1c2238)),
        scaffoldBackgroundColor: const Color(0xff252d49),
        dialogTheme: DialogTheme(backgroundColor: AppColors.black),
      );
}
