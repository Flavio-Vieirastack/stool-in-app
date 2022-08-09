part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
  @override
  List<Object?> get props => [message];
}

class HomeSucess extends HomeState {
  final List<ServiceProviderEntity> serviceProvider;
  HomeSucess({required this.serviceProvider});
   @override
  List<Object?> get props => [serviceProvider];
}
