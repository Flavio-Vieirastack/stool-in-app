import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import '../../../../core/helpers/security_acess_helper/security_acess_helper.dart';
import '../../../../core/helpers/shared_preferences/shared_preferences_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with SharedPreferencesHelper {
  final SecurityAcessHelper _securityAcessHelper;
  SplashCubit({required SecurityAcessHelper securityAcessHelper})
      : _securityAcessHelper = securityAcessHelper,
        super(SplashInitial());

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
  // TODO descomentar em release (Adicionando logica para ir para a home)
  // Future<void> goToOnBoardingPage() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final blockDevice = await _securityAcessHelper.blockDevice();
  //   if (!blockDevice) {
  //     final onboardingIsFinished =
  //         await getBool(key: KeysConstants.onboardingFlowKey);
  //     if (onboardingIsFinished == null) {
  //       emit(SplashGoToOnBoardingPage());
  //     } else {
  //       emit(SplashGoToLoginPage());
  //     }
  //   } else {
  //     emit(SplashStateBlockDevice());
  //   }
  // }
}
