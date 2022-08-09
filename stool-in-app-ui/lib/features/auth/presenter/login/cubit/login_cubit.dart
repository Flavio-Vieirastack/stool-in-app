import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/keys_constants.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUseCase _authUseCase;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  LoginCubit({
    required AuthUseCase authUseCase,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
  })  : _authUseCase = authUseCase,
        _writeLocalSecurityStorage = writeLocalSecurityStorage,
        super(LoginInitial());
  Future<void> makeFirebaseLogin({required AuthEntity authEntity}) async {
    emit(LoginLoading());
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

  Future<void> _makeApiLogin({required AuthEntity authEntity}) async {
    final result = await _authUseCase.apiLogin(
      authEntity: authEntity,
    );
    result.fold(
      (error) => emit(
        LoginError(message: error.message),
      ),
      (sucess) async {
        await _writeLocalSecurityStorage.write(
            key: KeysConstants.userToken, value: sucess.token);
        emit(LoginSucess());
      },
    );
  }
}
