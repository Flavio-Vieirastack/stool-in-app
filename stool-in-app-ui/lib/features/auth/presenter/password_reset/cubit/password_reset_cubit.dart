import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  final AuthUseCase _authUseCase;
  PasswordResetCubit({
    required AuthUseCase authUseCase,
  })  : _authUseCase = authUseCase,
        super(PasswordResetInitial());
}
