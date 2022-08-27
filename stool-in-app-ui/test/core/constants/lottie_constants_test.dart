import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/constants/export/constants_export.dart';


void main() {
  test('Deve retornar o lottie para lottieSucess', () {
    const lottie = LottieConstants.lottieSucess;
    const lottieName = 'assets/lotties/31975-successful-message.json';
    expect(lottie, lottieName);
  });
  test('Deve retornar o lottie para lottieError', () {
    const lottie = LottieConstants.lottieError;
    const lottieName = 'assets/lotties/97670-tomato-error.json';
    expect(lottie, lottieName);
  });
  test('Deve retornar o lottie para lottieNoConnection', () {
    const lottie = LottieConstants.lottieNoConnection;
    const lottieName = 'assets/lotties/84872-disconnected.json';
    expect(lottie, lottieName);
  });
  test('Deve retornar o lottie para lottieWaiting', () {
    const lottie = LottieConstants.lottieWaiting;
    const lottieName = 'assets/lotties/21421-waiting.json';
    expect(lottie, lottieName);
  });
  test('Deve retornar o lottie para lottieBlcoked', () {
    const lottie = LottieConstants.lottieBlcoked;
    const lottieName = 'assets/lotties/76732-locked-icon.json';
    expect(lottie, lottieName);
  });
}
