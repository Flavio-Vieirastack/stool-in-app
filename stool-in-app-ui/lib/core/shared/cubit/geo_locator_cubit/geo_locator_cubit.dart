import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stool_in_app_ui/core/constants/keys_constants.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';

part 'geo_locator_state.dart';

class GeoLocatorCubit extends Cubit<GeoLocatorState>
    with SharedPreferencesHelper {
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

  Future<void> getCurrentPosition() async {
    final isServiceEnabledFromUser = await isServiceEnabled();
    final isGeoLocatorAcepted = await isGeoLocatorPermited();
    if (isServiceEnabledFromUser && isGeoLocatorAcepted) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      log(
        'User position latitude ${position.latitude}, longitude ${position.longitude}',
      );
      saveDouble(
        key: KeysConstants.userLocationLatitude,
        value: position.latitude,
      );
      saveDouble(
        key: KeysConstants.userLocationaLogintude,
        value: position.longitude,
      );
    }
  }
}
