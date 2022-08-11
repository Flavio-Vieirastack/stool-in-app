import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';

void main() {
  test('Deve retornar a cor correta para buttonRightGradientColor', () {
    final sut = AppColors.buttonRightGradientColor;
    const matcher =  Color(0xfffcaf24);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para buttonLeftGradientColor', () {
    final sut = AppColors.buttonLeftGradientColor;
    const matcher =  Color(0xfffcdd80);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para textFormFieldBackgroundColor', () {
    final sut = AppColors.textFormFieldBackgroundColor;
    const matcher =  Color(0xff424242);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para greyScaleDark', () {
    final sut = AppColors.greyScaleDark;
    const matcher =  Color(0xff2a2a2a);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para black', () {
    final sut = AppColors.black;
    const matcher =  Color(0xff060606);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para blackOpaque', () {
    final sut = AppColors.blackOpaque;
    const matcher =  Color(0xff060606);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para white', () {
    final sut = AppColors.white;
    const matcher =  Color(0xffffffff);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para grey', () {
    final sut = AppColors.grey;
    const matcher =  Color(0xff969696);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para greyDisabled', () {
    final sut = AppColors.greyDisabled;
    const matcher =  Color.fromARGB(255, 95, 95, 95);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para blackInnedRadial', () {
    final sut = AppColors.blackInnedRadial;
    const matcher =  Color(0xff181818);
    expect(sut, matcher);
  });
}
