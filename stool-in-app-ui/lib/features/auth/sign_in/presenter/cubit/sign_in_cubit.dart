import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_logic/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthUseCase _authUseCase;
  SignInCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(SignInInitial());
}
