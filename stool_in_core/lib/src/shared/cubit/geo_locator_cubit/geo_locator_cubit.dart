import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../constants/keys_constants.dart';
import '../../../helpers/shared_preferences/shared_preferences_helper.dart';
import '../../../helpers/try_catch_helper.dart/try_catch_helper.dart';




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

  Future<bool> requestUserPermition() async {
   
    final result = await TryCatchHelper.makeRequest(
      function: () async {
        await requestPermition();
        emit(GeoLocatorSucess());
      },
      onError: () async {
        await _emitErrorStates();
      },
    );
    return result;
  }

  Future<void> requestPermition() async {
    await Geolocator.requestPermission();
    await _saveCurrentPositionInCache();
  }

  Future<void> _emitErrorStates() async {
    final serviceEnabled = await isServiceEnabled();
    final permistion = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      emit(GeoLocatorNotEnabled());
    } else if (permistion == LocationPermission.denied) {
      emit(GeoLocatorDenied());
    } else if (permistion == LocationPermission.deniedForever) {
      emit(GeoLocatorDeniedForever());
    } else {
      emit(GeoLocatorSucess());
    }
  }

  Future<void> _saveCurrentPositionInCache() async {
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
