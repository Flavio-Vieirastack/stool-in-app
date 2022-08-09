import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUseCase _authUseCase;
  LoginCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(LoginInitial());
}
