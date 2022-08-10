part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}
class LoginSucess extends LoginState {}
class LoginEnableApiPasswordReset extends LoginState{}
class LoginGeoLocatorNotEnabled extends LoginState{}
class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
  @override
  List<Object?> get props => [message];
}
