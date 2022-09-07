import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';

void main() {
  test('Deve retornar o estilo correto para headLine0', () {
    final sut = AppTextStyles.headLine0;
    final matcher = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.exo2().fontFamily,
      fontSize: 32.dp,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine1', () {
    final sut = AppTextStyles.headLine1;
    final matcher = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.exo2().fontFamily,
      fontSize: 20,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine1Gold', () {
    final sut = AppTextStyles.headLine1Gold;
    final matcher = TextStyle(
        color: AppColors.buttonLeftGradientColor,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.exo2().fontFamily,
        fontSize: 18,
        decoration: TextDecoration.underline);
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine2', () {
    final sut = AppTextStyles.headLine2;
    final matcher = TextStyle(
      color: AppColors.white,
      fontFamily: GoogleFonts.exo2().fontFamily,
      fontSize: 17,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine2UnderLine', () {
    final sut = AppTextStyles.headLine2UnderLine;
    final matcher = TextStyle(
        color: AppColors.white,
        fontFamily: GoogleFonts.exo2().fontFamily,
        fontSize: 17,
        decoration: TextDecoration.underline);
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine3', () {
    final sut = AppTextStyles.headLine3;
    final matcher = TextStyle(
      color: AppColors.white,
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontSize: 16,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine4', () {
    final sut = AppTextStyles.headLine4;
    final matcher = TextStyle(
      color: AppColors.white,
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontSize: 14,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine4Italic', () {
    final sut = AppTextStyles.headLine4Italic;
    final matcher = TextStyle(
        color: AppColors.white,
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 14,
        fontStyle: FontStyle.italic);
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine4Gray', () {
    final sut = AppTextStyles.headLine4Gray;
    final matcher = TextStyle(
      color: AppColors.grey,
      fontFamily: GoogleFonts.prata().fontFamily,
      fontSize: 14,
    );
    expect(sut, matcher);
  });
  test('Deve retornar o estilo correto para headLine4Gold', () {
    final sut = AppTextStyles.headLine4Gold;
    final matcher = TextStyle(
        color: AppColors.buttonLeftGradientColor,
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 14,
        decoration: TextDecoration.underline);
    expect(sut, matcher);
  });
}
