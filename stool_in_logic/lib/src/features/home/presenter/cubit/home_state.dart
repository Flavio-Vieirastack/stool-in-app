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
  final List<ServiceProviderEntity>? serviceProvider;
  final List<CategoriesEntity>? categories;
  final UserUniqueEntity? userUniqueEntity;
  final String? userImage;
  final String? userName;
  HomeSucess({
    this.serviceProvider,
    this.categories,
    this.userImage,
    this.userName,
    this.userUniqueEntity,
  });
  @override
  List<Object?> get props => [
        serviceProvider,
        categories,
        userImage,
        userName,
        userUniqueEntity,
      ];
}

class HomeStateGoToDataPage extends HomeState {}

class HomeStateNoData extends HomeState {}
