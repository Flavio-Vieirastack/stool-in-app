import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/export/constants_export.dart';
import '../../../../core/helpers/export/helpers_export.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState>
    with SharedPreferencesHelper {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> gotToLoginPageAndSaveOnBoardingFlow() async {
   await saveBool(key: KeysConstants.onboardingFlowKey, value: true);
    emit(OnBoardingGoToLoginPage());
  }
}
