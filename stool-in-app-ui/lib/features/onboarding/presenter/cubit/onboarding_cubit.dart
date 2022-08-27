import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../exports/app_exports.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState>
    with SharedPreferencesHelper {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> gotToLoginPageAndSaveOnBoardingFlow() async {
   await saveBool(key: KeysConstants.onboardingFlowKey, value: true);
    emit(OnBoardingGoToLoginPage());
  }
}
