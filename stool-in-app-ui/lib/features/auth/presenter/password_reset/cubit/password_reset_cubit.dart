import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState>
    with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  PasswordResetCubit({
    required AuthUseCase authUseCase,
  })  : _authUseCase = authUseCase,
        super(
          PasswordResetInitial(),
        );

  Future<void> firebasePasswordReset({
    required AuthEntity authEntity,
    required bool validate,
  }) async {
    if (validate) {
      emit(PasswordResetLoading());
      final result =
          await _authUseCase.firebasePasswordReset(authEntity: authEntity);
      result.fold(
        (error) => emit(PasswordResetError()),
        (sucess) async {
          saveBool(
              key: KeysConstants.userMakePasswordResetSolicitation,
              value: true);
          emit(
            PasswordResetRedirectToLogin(),
          );
        },
      );
    }
  }
}
