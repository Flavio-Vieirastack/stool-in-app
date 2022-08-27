import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/helpers/export/helpers_export.dart';
import '../../../export/auth_exports.dart';


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
