part of 'sign_in_user_data_cubit.dart';

@immutable
abstract class SignInUserDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInUserDataInitial extends SignInUserDataState {}

class SignInUserDataLoading extends SignInUserDataState {}

class SignInUserDataStateNotSelected extends SignInUserDataState {}

class SignInUserDataError extends SignInUserDataState {}

class SignInUserDataLoginApiSucess extends SignInUserDataState {}

class SignInUserDataLoginFirebaseSucess extends SignInUserDataState {}

class SignInUserDataSucess extends SignInUserDataState {}
