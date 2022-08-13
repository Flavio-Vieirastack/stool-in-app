part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final String? urlImage;
  LoginInitial({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginLoading extends LoginState {
  final String? urlImage;
  LoginLoading({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginSucess extends LoginState {
  final String? urlImage;
  LoginSucess({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginEnableApiPasswordReset extends LoginState {
  final String? urlImage;
  LoginEnableApiPasswordReset({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginGeoLocatorNotEnabled extends LoginState {
  final String? urlImage;
  LoginGeoLocatorNotEnabled({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginGeoLocatorNotEnabledForever extends LoginState {
  final String? urlImage;
  LoginGeoLocatorNotEnabledForever({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginError extends LoginState {
  final String message;
  final String? urlImage;
  LoginError({required this.message, this.urlImage});
  @override
  List<Object?> get props => [message, urlImage];
}

class LoginEmailNotVerified extends LoginState {}

class LoginEmailNoSended extends LoginState {
  final String message;
  LoginEmailNoSended({required this.message});
  @override
  List<Object?> get props => [message];
}

class LoginEmailSended extends LoginState {}

class LoginEmailVerified extends LoginState {}
