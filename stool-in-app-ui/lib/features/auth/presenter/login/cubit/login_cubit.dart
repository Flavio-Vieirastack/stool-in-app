import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../exports/app_exports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  final ReadLocalSecurityStorage _readLocalSecurityStorage;
  final GeoLocatorCubit _geoLocatorCubit;
  final FirebaseAuth _firebaseAuth;
  final SignInCubit _signInCubit;
  final SendVerificationEmailUsecase _sendVerificationEmailUsecase;
  LoginCubit({
    required AuthUseCase authUseCase,
    required SignInCubit signInCubit,
    required ReadLocalSecurityStorage readLocalSecurityStorage,
    required FirebaseAuth firebaseAuth,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
    required SendVerificationEmailUsecase sendVerificationEmailUsecase,
    required GeoLocatorCubit geoLocatorCubit,
  })  : _authUseCase = authUseCase,
        _firebaseAuth = firebaseAuth,
        _signInCubit = signInCubit,
        _readLocalSecurityStorage = readLocalSecurityStorage,
        _geoLocatorCubit = geoLocatorCubit,
        _sendVerificationEmailUsecase = sendVerificationEmailUsecase,
        _writeLocalSecurityStorage = writeLocalSecurityStorage,
        super(LoginInitial());

  Future<void> enableApiPasswordResetOnInit() async {
    final userImageUrl = await getString(key: KeysConstants.userPhotoUrl);
    final userMakeResetSolicitation =
        await getBool(key: KeysConstants.userMakePasswordResetSolicitation);
    if (userMakeResetSolicitation != null && userMakeResetSolicitation) {
      emit(
        LoginEnableApiPasswordReset(urlImage: userImageUrl),
      );
    }
  }

  Future<String?> getUserImageOnInit() async {
    final urlImage = await getString(key: KeysConstants.userPhotoUrl);
    final userMakeResetSolicitation =
        await getBool(key: KeysConstants.userMakePasswordResetSolicitation);
    if (userMakeResetSolicitation == null) {
      emit(LoginInitial(urlImage: urlImage));
    }
    return urlImage;
  }

  Future<void> verifyUserEmailOnInit() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.currentUser?.reload();
      final emailVerified = _firebaseAuth.currentUser?.emailVerified;
      final urlImage = await getUserImageOnInit();
      if (emailVerified != null && emailVerified == false) {
        emit(LoginEmailNotVerified(urlImage: urlImage));
      }
    }
  }

  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.reload();
    final result = await _sendVerificationEmailUsecase.call();
    final urlImage = await getUserImageOnInit();
    result.fold(
      (error) => emit(LoginEmailNoSended(message: error.message)),
      (sucess) => emit(
        LoginEmailSended(urlImage: urlImage),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    await _firebaseAuth.currentUser?.reload();
    final emailVerified = _firebaseAuth.currentUser?.emailVerified;
    final urlImage = await getUserImageOnInit();
    if (emailVerified != null && emailVerified) {
      final userEmail =
          await _readLocalSecurityStorage.read(key: KeysConstants.userEmail);
      final userPassword =
          await _readLocalSecurityStorage.read(key: KeysConstants.userPassword);
      final result = await TryCatchHelper.makeRequest(
        function: () async => _signInCubit.checkEmailVerifiedAndSaveUserInApi(
          authEntity: AuthEntity(
            email: userEmail ?? '',
            password: userPassword ?? '',
          ),
        ),
      );

      if (result) {
        emit(LoginSignInStateSucess(urlImage: urlImage));
      } else {
        await _firebaseAuth.currentUser?.delete();
        emit(LoginSignInStateError(urlImage: urlImage));
      }
      emit(LoginEmailVerified(urlImage: urlImage));
    } else {
      emit(LoginEmailRequestNotVerified(urlImage: urlImage));
    }
  }

  Future<void> makeLogin({
    required AuthEntity authEntity,
    required bool validate,
  }) async {
    if (validate) {
      final userImageUrl = await getString(key: KeysConstants.userPhotoUrl);
      emit(LoginLoading(urlImage: userImageUrl));
      final result = await _authUseCase.firebaseLogin(
        authEntity: authEntity,
      );
      result.fold(
        (error) => emit(
          LoginError(message: error.message, urlImage: userImageUrl),
        ),
        (sucess) async {
          await _makeApiLogin(authEntity: authEntity);
        },
      );
    }
  }

  Future<void> apiPasswordReset({
    required AuthEntity authEntity,
    required bool validate,
  }) async {
    if (validate) {
      final userImageUrl = await getString(key: KeysConstants.userPhotoUrl);
      emit(LoginLoading(urlImage: userImageUrl));
      final result =
          await _authUseCase.apiPasswordReset(authEntity: authEntity);

      result.fold(
        (error) => emit(
          LoginError(
            message: error.message,
            urlImage: userImageUrl,
          ),
        ),
        (sucess) async {
          await _makeApiLogin(authEntity: authEntity);
          removeCache(key: KeysConstants.userMakePasswordResetSolicitation);
          emit(
            LoginSucess(urlImage: userImageUrl),
          );
        },
      );
    }
  }

  Future<void> _makeApiLogin({
    required AuthEntity authEntity,
  }) async {
    final userImageUrl = await getString(key: KeysConstants.userPhotoUrl);
    final result = await _authUseCase.apiLogin(
      authEntity: authEntity,
    );
    result.fold(
      (error) => emit(
        LoginError(message: error.message, urlImage: userImageUrl),
      ),
      (sucess) async {
        await _writeLocalSecurityStorage.write(
          key: KeysConstants.userToken,
          value: sucess.token,
        );
        final token =
            await _readLocalSecurityStorage.read(key: KeysConstants.userToken);
        log(token ?? 'Token nulo');
        removeCache(
          key: KeysConstants.userMakePasswordResetSolicitation,
        );
        emit(LoginSucess(urlImage: userImageUrl));
      },
    );
  }

  Future<void> goToSignInMainPageWithGeoLocationPermition({
    required Function navigateToSignIn,
  }) async {
    final userImageUrl = await getString(key: KeysConstants.userPhotoUrl);
    final urlImage = await getUserImageOnInit();
    final isGeolocationEnabled = await _geoLocatorCubit.requestUserPermition();
    if (isGeolocationEnabled) {
      navigateToSignIn.call();
    } else {
      if (Platform.isIOS) {
        emit(LoginGeoLocatorNotEnabledForever(urlImage: urlImage));
      } else {
        emit(LoginGeoLocatorNotEnabled(urlImage: userImageUrl));
      }
      await Future.delayed(const Duration(seconds: 1));
      emit(LoginInitial(urlImage: userImageUrl));
    }
  }
}
