part of 'sign_in_user_data_cubit.dart';

abstract class SignInUserDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInUserDataInitial extends SignInUserDataState {
  final String? userPhotoUrl;
  SignInUserDataInitial({ this.userPhotoUrl});
  @override
  List<Object?> get props => [userPhotoUrl];
}

class SignInUserDataLoading extends SignInUserDataState {
  final String? userUrlImage;
  SignInUserDataLoading({required this.userUrlImage});
  @override
  List<Object?> get props => [userUrlImage];
}

class SignInUserDataStateNotSelected extends SignInUserDataState {}

class SignInUserDataError extends SignInUserDataState {
  final String message;
  SignInUserDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class SignInUserDataLoginApiSucess extends SignInUserDataState {
  final String? userUrlImage;
  SignInUserDataLoginApiSucess({required this.userUrlImage});
  @override
  List<Object?> get props => [userUrlImage];
}

class SignInUserDataLoginFirebaseSucess extends SignInUserDataState {
  final String? userUrlImage;
  SignInUserDataLoginFirebaseSucess({required this.userUrlImage});
  @override
  List<Object?> get props => [userUrlImage];
}

class SignInUserDataSucess extends SignInUserDataState {
  final String? userUrlImage;
  SignInUserDataSucess({required this.userUrlImage});
  @override
  List<Object?> get props => [userUrlImage];
}
