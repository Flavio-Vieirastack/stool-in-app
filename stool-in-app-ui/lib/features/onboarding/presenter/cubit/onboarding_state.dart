part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnBoardingGoToLoginPage extends OnboardingState {}