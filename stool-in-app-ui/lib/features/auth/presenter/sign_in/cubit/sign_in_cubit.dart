import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../exports/app_exports.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  final FirebaseAuth _firebaseAuth;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  final FireBaseNotifications _fireBaseNotifications;
  final SendVerificationEmailUsecase _sendVerificationEmailUsecase;
  SignInCubit({
    required AuthUseCase authUseCase,
    required FirebaseAuth firebaseAuth,
    required SendVerificationEmailUsecase sendVerificationEmailUsecase,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
    required FireBaseNotifications fireBaseNotifications,
  })  : _authUseCase = authUseCase,
        _firebaseAuth = firebaseAuth,
        _sendVerificationEmailUsecase = sendVerificationEmailUsecase,
        _writeLocalSecurityStorage = writeLocalSecurityStorage,
        _fireBaseNotifications = fireBaseNotifications,
        super(SignInInitial());
  void makeSignIn({
    required AuthEntity authEntity,
    required Timer? timer,
    required bool validate,
  }) async {
    if (validate) {
      emit(SignInStateLoading());
      final signIn = await _authUseCase.firebaseSignIn(authEntity: authEntity);
      signIn.fold(
        (error) => emit(
          SignInStateError(message: error.message),
        ),
        (sucess) async {
          await sendVerificationEmail(timer: timer);
        },
      );
    }
  }

  Future<void> checkEmailVerifiedAndSaveUserInApi({
    required AuthEntity authEntity,
  }) async {
    await _firebaseAuth.currentUser?.reload();
    final emailVerified = _firebaseAuth.currentUser?.emailVerified;
    if (emailVerified!) {
      await saveBool(key: KeysConstants.userPassByDataPage, value: false);
      final userPushToken = await _fireBaseNotifications.getTokenFirebase();
      await _writeLocalSecurityStorage.write(
        key: KeysConstants.userFirebasePushToken,
        value: userPushToken ?? '',
      );
      final userEmail = _firebaseAuth.currentUser?.email;
      await _writeLocalSecurityStorage.write(
        key: KeysConstants.userEmail,
        value: userEmail ?? '',
      );
      final userFirebaseUuid = _firebaseAuth.currentUser?.uid;
      await _writeLocalSecurityStorage.write(
        key: KeysConstants.userFirebaseToken,
        value: userFirebaseUuid ?? '',
      );
      await _writeLocalSecurityStorage.write(
        key: KeysConstants.userPassword,
        value: authEntity.password ?? '',
      );

      await _makeSignInInApi(
        userEmail: authEntity.email,
        userPassword: authEntity.password ?? '',
      );
      emit(SignInStateEmailAccepted());
    } else {
      emit(SignInEmailNotVerified());
      await Future.delayed(
        const Duration(seconds: 3),
        () => emit(
          SignInStateEmailSended(),
        ),
      );
    }
  }

  Future<void> sendVerificationEmail({Timer? timer}) async {
    final emailVerified = _firebaseAuth.currentUser?.emailVerified;
    if (emailVerified == null || !emailVerified) {
      final result = await _sendVerificationEmailUsecase.call();
      result.fold(
        (error) async {
          emit(
            SignInStateSendVerificationEmailError(message: error.message),
          );
          await _firebaseAuth.currentUser?.delete();
          timer?.cancel();
        },
        (sucess) {
          emit(SignInStateEmailSended());
        },
      );
    }
  }

  Future<void> _makeSignInInApi({
    required String userEmail,
    required String userPassword,
  }) async {
    final userUuid = _firebaseAuth.currentUser?.uid;
    final result = await _authUseCase.apiSignIn(
      authEntity: AuthEntity(
        email: userEmail,
        password: userPassword,
        firebaseUuid: userUuid,
      ),
    );
    result.fold(
      (error) async {
        if (userUuid == null) {
          await _firebaseAuth.currentUser?.delete();
        }
        emit(
          SignInStateError(message: error.message),
        );
      },
      (sucess) async {
        await Future.delayed(const Duration(seconds: 3));
        emit(SignInStateSucess());
      },
    );
  }
}
