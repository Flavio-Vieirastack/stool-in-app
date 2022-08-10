part of 'geo_locator_cubit.dart';

abstract class GeoLocatorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeoLocatorInitial extends GeoLocatorState {}
class GeoLocatorSucess extends GeoLocatorState {}
class GeoLocatorNotEnabled extends GeoLocatorState {}
class GeoLocatorDenied extends GeoLocatorState {}
class GeoLocatorDeniedForever extends GeoLocatorState {}
