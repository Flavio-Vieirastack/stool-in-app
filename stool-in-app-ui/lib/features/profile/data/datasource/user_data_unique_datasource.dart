import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';

import '../../../../core/helpers/distance_helper/distance_helper_calculate.dart';
import '../../../../core/rest_client/rest_client_response.dart';
import '../model/services_contracted_model.dart';

abstract class UserDataUniqueDatasource {
  Future<UserDataUniqueEntity> getUserDataUnique({required Location location});
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