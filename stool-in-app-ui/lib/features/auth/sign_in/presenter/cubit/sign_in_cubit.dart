import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_logic/core/constants/keys_constants.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in_app_ui/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  final FirebaseAuth _firebaseAuth;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  final FireBaseNotifications _fireBaseNotifications;
  SignInCubit({
    required AuthUseCase authUseCase,
    required FirebaseAuth firebaseAuth,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
    required FireBaseNotifications fireBaseNotifications
  })  : _authUseCase = authUseCase,
        _firebaseAuth = firebaseAuth,
        _writeLocalSecurityStorage = writeLocalSecurityStorage,
        _fireBaseNotifications = fireBaseNotifications,
        super(SignInInitial());
  void makeSignIn(
      {required AuthEntity authEntity, required Timer? timer}) async {
    emit(SignInStateLoading());
    final signIn = await _authUseCase.firebaseSignIn(authEntity: authEntity);
    signIn.fold(
      (error) => emit(
        SignInStateError(message: error.message),
      ),
      (sucess) {
        emit(SignInStateEmailSended());
        timer = Timer.periodic(
          const Duration(seconds: 3),
          (_) => _checkEmailVerified(timer),
        );
      },
    );
  }

  Future<void> _checkEmailVerified(Timer? timer) async {
    await _firebaseAuth.currentUser?.reload();
    final emailVerified = _firebaseAuth.currentUser?.emailVerified;
    if (emailVerified!) {
      emit(SignInStateEmailAccepted());
      saveBool(key: KeysConstants.userPassByDataPage, value: false);
    }
  }
}
