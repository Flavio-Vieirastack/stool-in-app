import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/core/shared/cubit/geo_locator_cubit/geo_locator_cubit.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  final GeoLocatorCubit _geoLocatorCubit;
  final FirebaseAuth _firebaseAuth;
  LoginCubit({
    required AuthUseCase authUseCase,
    required FirebaseAuth firebaseAuth,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
    required GeoLocatorCubit geoLocatorCubit,
  })  : _authUseCase = authUseCase,
        _firebaseAuth = firebaseAuth,
        _geoLocatorCubit = geoLocatorCubit,
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

  Future<void> verifyUserEmailOnInit() async {
    final emailVerified = await _firebaseAuth.currentUser?.emailVerified;
    if (emailVerified == null || emailVerified == false) {
      emit(LoginEmailNotVerified());
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
          LoginError(message: error.message),
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
          LoginError(message: error.message),
        ),
        (sucess) async {
          await _makeApiLogin(authEntity: authEntity);
          emit(
            LoginSucess(),
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
    final isGeolocationEnabled = await _geoLocatorCubit.requestUserPermition();
    if (isGeolocationEnabled) {
      navigateToSignIn.call();
    } else {
      if (Platform.isIOS) {
        emit(LoginGeoLocatorNotEnabledForever());
      } else {
        emit(LoginGeoLocatorNotEnabled(urlImage: userImageUrl));
      }
      await Future.delayed(const Duration(seconds: 1));
      emit(LoginInitial(urlImage: userImageUrl));
    }
  }
}
