import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/keys_constants.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with SharedPreferencesHelper {
  SplashCubit() : super(SplashInitial());

  Future<void> goToOnBoardingPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final onboardingIsFinished =
        await getBool(key: KeysConstants.onboardingFlowKey);
    if (onboardingIsFinished == null) {
      emit(SplashGoToOnBoardingPage());
    } else {
      emit(SplashGoToLoginPage());
    }
  }
}
