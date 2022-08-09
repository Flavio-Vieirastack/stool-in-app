part of 'password_reset_cubit.dart';

abstract class PasswordResetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PasswordResetInitial extends PasswordResetState {}

class PasswordResetLoading extends PasswordResetState {}

class PasswordResetError extends PasswordResetState {}
class PasswordResetEnableApiReset extends PasswordResetState {}

class PasswordResetSucess extends PasswordResetState {}
