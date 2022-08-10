import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/constants/assets_constants.dart';

void main() {
  test('Deve retornar o caminho do asset logos_white corretamente', () {
    const constant = AssetsConstants.logoWhite;
    const constanteName = 'assets/images/logos_white.png';
    expect(constant, constanteName);
  });
  test('Deve retornar o caminho do asset onboardingFirstImage corretamente',
      () {
    const constant = AssetsConstants.onboardingFirstImage;
    const constanteName = 'assets/images/woman_1.jpeg';
    expect(constant, constanteName);
  });
  test('Deve retornar o caminho do asset onboardingSecondImage corretamente',
      () {
    const constant = AssetsConstants.onboardingSecondImage;
    const constanteName = 'assets/images/man_1.jpeg';
    expect(constant, constanteName);
  });
  test('Deve retornar o caminho do asset onboardingLastImage corretamente',
      () {
    const constant = AssetsConstants.onboardingLastImage;
    const constanteName = 'assets/images/woman_2.jpeg';
    expect(constant, constanteName);
  });
}
