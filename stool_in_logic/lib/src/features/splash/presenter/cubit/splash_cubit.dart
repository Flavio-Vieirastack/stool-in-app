import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_core/stool_in_core.dart';




part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with SharedPreferencesHelper {
  final SecurityAcessHelper _securityAcessHelper;
  final FirebaseAuth _firebaseAuth;
  final SplashExecuteCacheActionsHelper _splashExecuteCacheActionsHelper;
  SplashCubit({
    required SecurityAcessHelper securityAcessHelper,
    required FirebaseAuth firebaseAuth,
    required SplashExecuteCacheActionsHelper splashExecuteCacheActionsHelper,
  })  : _securityAcessHelper = securityAcessHelper,
        _splashExecuteCacheActionsHelper = splashExecuteCacheActionsHelper,
        _firebaseAuth = firebaseAuth,
        super(SplashInitial());

  Future<void> goToOnBoardingPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final onboardingIsFinished =
        await getBool(key: KeysConstants.onboardingFlowKey);
    final userPassToData = await _userPassToDataPage();
    final userBeenInDataPageAndNotComplete =
        await _userBeenInDataPageAndGetError();
    if (onboardingIsFinished == null) {
      emit(SplashGoToOnBoardingPage());
    } else if (userPassToData) {
      await _splashExecuteCacheActionsHelper.execute();
      emit(SplashGoToHomePage());
    } else if (userBeenInDataPageAndNotComplete) {
      emit(SplashGoToUserDataPage());
    } else {
      emit(SplashGoToLoginPage());
    }
  }

  Future<bool> _userPassToDataPage() async {
    // TODO melhorar esse tratamento
    final userPassToDataPage =
        await getBool(key: KeysConstants.userPassByDataPage);
    if (userPassToDataPage != null && userPassToDataPage) {
      return true;
    }
    return false;
  }

  Future<bool> _userBeenInDataPageAndGetError() async {
    final userPassByFirebaseDataPage =
        await getBool(key: KeysConstants.userPassLoginToFirebase);
    final userPassByApiDataPage =
        await getBool(key: KeysConstants.userPassLoginToApi);
    if (userPassByApiDataPage != null && userPassByApiDataPage == false ||
        userPassByFirebaseDataPage != null &&
            userPassByFirebaseDataPage == false) {
      return true;
    }
    return false;
  }
  // TODO descomentar em release (Adicionando logica para ir para a home e data)
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
