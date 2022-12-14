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

class LoginEmailNotVerified extends LoginState {
  final String? urlImage;
  LoginEmailNotVerified({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginEmailNoSended extends LoginState {
  final String message;
  final String? urlImage;
  LoginEmailNoSended({required this.message, this.urlImage});
  @override
  List<Object?> get props => [message];
}

class LoginEmailSended extends LoginState {
  final String? urlImage;
  LoginEmailSended({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginEmailVerified extends LoginState {
  final String? urlImage;
  LoginEmailVerified({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginEmailRequestNotVerified extends LoginState {
  final String? urlImage;
  LoginEmailRequestNotVerified({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginSignInStateError extends LoginState {
  final String? urlImage;
  LoginSignInStateError({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}

class LoginSignInStateSucess extends LoginState {
  final String? urlImage;
  LoginSignInStateSucess({this.urlImage});
  @override
  List<Object?> get props => [urlImage];
}
