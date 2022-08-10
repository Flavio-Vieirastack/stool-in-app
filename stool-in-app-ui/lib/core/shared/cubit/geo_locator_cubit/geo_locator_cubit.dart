import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

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

  Future<void> checkPermitions() async {
    final permition = await Geolocator.checkPermission();
    await _emitNotActiveStateOnInit();
    await _requestPermition();
    if (permition == LocationPermission.denied) {
      emit(GeoLocatorDenied());
    } else if (permition == LocationPermission.deniedForever) {
      emit(GeoLocatorDeniedForever());
      await _requestPermition();
    }
  }

  Future<void> _requestPermition() async {
    final permition = await Geolocator.requestPermission();
    if (permition == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else {
      await _getCurrentPosition();
    }
  }

  Future<void> _emitNotActiveStateOnInit() async {
    final serviceEnabled = await isServiceEnabled();
    if (!serviceEnabled) {
      emit(GeoLocatorNotEnabled());
    }
  }

  Future<void> _getCurrentPosition() async {
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
