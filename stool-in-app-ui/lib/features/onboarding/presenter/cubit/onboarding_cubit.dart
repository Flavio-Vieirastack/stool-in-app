import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import '../../../../core/helpers/shared_preferences/shared_preferences_helper.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState>
    with SharedPreferencesHelper {
  OnboardingCubit() : super(OnboardingInitial());

  void gotToLoginPageAndSaveOnBoardingFlow() {
    saveBool(key: KeysConstants.onboardingFlowKey, value: true);
    emit(OnBoardingGoToLoginPage());
  }
}
