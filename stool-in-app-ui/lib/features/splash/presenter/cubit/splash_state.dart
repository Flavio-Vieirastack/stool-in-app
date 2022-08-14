part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashGoToOnBoardingPage extends SplashState {}

class SplashGoToLoginPage extends SplashState {}

class SplashGoToHomePage extends SplashState {}

class SplashGoToUserDataPage extends SplashState {}

class SplashStateBlockDevice extends SplashState {}
