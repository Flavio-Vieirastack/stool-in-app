import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void goToOnBoardingPage() {
    Future.delayed(const Duration(seconds: 2));
    emit(SplashGoToOnBoardingPage());
  }
}