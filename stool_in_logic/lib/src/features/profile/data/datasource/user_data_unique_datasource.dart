
import 'package:stool_in_core/stool_in_core.dart';

import '../../../auth/data/model/user_data_model.dart';
import '../../domain/entity/user_data_unique_entity.dart';
import '../../domain/entity/user_data_unique_location.dart';
import '../model/services_contracted_model.dart';

abstract class UserDataUniqueDatasource {
  Future<UserDataUniqueEntity> getUserDataUnique({required UserDataUniqueLocation userDataUniqueLocation});
  Future<void> updateUserData({required UserDataModel userDataModel});
}

class CalculateDistanceForUserDataUnique {
  final DistanceHelperCalculate _distanceHelperCalculate;
  CalculateDistanceForUserDataUnique({
    required DistanceHelperCalculate distanceHelperCalculate,
  }) : _distanceHelperCalculate = distanceHelperCalculate;

  int calculateDistance({
    required RestClientResponse<dynamic> result,
    required Location userLocation,
  }) {
    final data = ServicesContractedModel.fromMap(result.data);
    final serviceProviderLatitude = data.userLocationLatitude;
    final serviceProviderLongitude = data.userLocationaLogintude;
    final distance = _distanceHelperCalculate.caculateDistanceToInt(
      currentUserLocation: userLocation,
      serviceProviderLocation: Location(
        latitude: serviceProviderLatitude,
        longitude: serviceProviderLongitude,
      ),
    );
    return distance;
  }
}