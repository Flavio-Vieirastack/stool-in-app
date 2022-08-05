

import 'package:equatable/equatable.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
