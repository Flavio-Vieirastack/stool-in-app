part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInStateLoading extends SignInState {}

class SignInStateEmailSended extends SignInState {}

class SignInStateEmailAccepted extends SignInState {}

class SignInStateError extends SignInState {
  final String message;
  SignInStateError({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class SignInStateSucess extends SignInState {}

class SignInStateSendVerificationEmailError extends SignInState {
  final String message;
  SignInStateSendVerificationEmailError({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class SignInEmailNotVerified extends SignInState {}

class SignInStateEmailNotRecieved extends SignInState {}
