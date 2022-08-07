import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'sign_in_user_data_state.dart';

class SignInUserDataCubit extends Cubit<SignInUserDataState> {
  final AuthUseCase _authUseCase;
  SignInUserDataCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(SignInUserDataInitial());
}
