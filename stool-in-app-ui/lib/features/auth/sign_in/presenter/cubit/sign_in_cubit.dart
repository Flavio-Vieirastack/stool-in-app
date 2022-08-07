import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthUseCase _authUseCase;
  final FirebaseAuth _firebaseAuth;
  SignInCubit({
    required AuthUseCase authUseCase,
    required FirebaseAuth firebaseAuth,
  })  : _authUseCase = authUseCase,
        _firebaseAuth = firebaseAuth,
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

  Future<void> _checkEmailVerified(Timer? timer) async {}
}
