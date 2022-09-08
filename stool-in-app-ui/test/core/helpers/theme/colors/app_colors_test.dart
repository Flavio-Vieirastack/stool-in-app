import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_ds/stool_ds.dart';


void main() {
  test('Deve retornar a cor correta para buttonRightGradientColor', () {
    const sut =  AppColors.buttonRightGradientColor;
    const matcher =  Color(0xfffcaf24);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para buttonLeftGradientColor', () {
    const sut = AppColors.buttonLeftGradientColor;
    const matcher =  Color(0xfffcdd80);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para textFormFieldBackgroundColor', () {
    const sut = AppColors.textFormFieldBackgroundColor;
    const matcher =  Color(0xff424242);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para greyScaleDark', () {
    const sut = AppColors.greyScaleDark;
    const matcher =  Color(0xff2a2a2a);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para black', () {
    const sut = AppColors.black;
    const matcher =  Color(0xff1c2238);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para blackOpaque', () {
    const sut = AppColors.blackOpaque;
    const matcher =  Color(0xff060606);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para white', () {
    const sut = AppColors.white;
    const matcher =  Color(0xffc9cee1);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para grey', () {
    const sut = AppColors.grey;
    const matcher =  Color(0xff4c5573);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para greyDisabled', () {
    const sut = AppColors.greyDisabled;
    const matcher =  Color.fromARGB(255, 95, 95, 95);
    expect(sut, matcher);
  });
  test('Deve retornar a cor correta para blackInnedRadial', () {
    const sut = AppColors.blackInnedRadial;
    const matcher =  Color(0xff181818);
    expect(sut, matcher);
  });
}
