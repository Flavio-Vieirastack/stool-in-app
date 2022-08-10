import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'geo_locator_state.dart';

class GeoLocatorCubit extends Cubit<GeoLocatorState> {
  GeoLocatorCubit() : super(GeoLocatorInitial());
  Future<bool> isServiceEnabled() async {
    final active = await Geolocator.isLocationServiceEnabled();
    if (active) {
      return true;
    }
    return false;
  }

  Future<bool> isGeoLocatorPermited() async {
    final permition = await Geolocator.checkPermission();
    if (permition == LocationPermission.denied) {
      emit(GeoLocatorDenied());
      return false;
    } else if (permition == LocationPermission.deniedForever) {
      emit(GeoLocatorDeniedForever());
    }
    return true;
  }

  Future<void> requestPermition() async {
    final permition = await Geolocator.requestPermission();
    if (permition == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
  }

  Future<void> emitNotActiveStateOnInit() async {
    final serviceEnabled = await isServiceEnabled();
    if (!serviceEnabled) {
      emit(GeoLocatorNotEnabled());
    }
  }

  Future<Position?> getCurrentPosition() async {
    final isServiceEnabledFromUser = await isServiceEnabled();
    final isGeoLocatorAcepted = await isGeoLocatorPermited();
    if (isServiceEnabledFromUser && isGeoLocatorAcepted) {
      final position = await Geolocator.getCurrentPosition();
      log(
        'User position latitude ${position.latitude}, longitude ${position.longitude}',
      );
      return position;
    }
    return null;
  }
}
