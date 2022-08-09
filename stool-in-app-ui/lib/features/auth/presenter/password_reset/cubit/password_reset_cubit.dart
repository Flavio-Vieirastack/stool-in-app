import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/keys_constants.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

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
  }) async {
    final result =
        await _authUseCase.firebasePasswordReset(authEntity: authEntity);
    result.fold(
      (error) => emit(PasswordResetError()),
      (sucess) async {
        saveBool(
            key: KeysConstants.userMakePasswordResetSolicitation, value: true);
        emit(
          PasswordResetEnableApiReset(),
        );
      },
    );
  }

  Future<void> apiPasswordReset({
    required AuthEntity authEntity,
  }) async {
    final result = await _authUseCase.apiPasswordReset(authEntity: authEntity);
    result.fold(
      (l) => emit(
        PasswordResetError(),
      ),
      (r) async {
        emit(
          PasswordResetSucess(),
        );
        removeCache(key: KeysConstants.userMakePasswordResetSolicitation);
      },
    );
  }
}
