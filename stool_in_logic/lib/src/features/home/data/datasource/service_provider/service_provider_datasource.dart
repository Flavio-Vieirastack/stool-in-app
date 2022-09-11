
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';



abstract class GetServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({
    required int pageQuantity,
  });
}

// class ServiceProviderDatasourceCalculateDistance {
//   final DistanceHelperCalculate _distanceHelperCalculate;
//   ServiceProviderDatasourceCalculateDistance({
//     required DistanceHelperCalculate distanceHelperCalculate,
//   }) : _distanceHelperCalculate = distanceHelperCalculate;
//   List<ServiceProviderModel>? calculateDistance({
//     required RestClientResponse<List<dynamic>> result,
//     required GetServiceProvidersParams params,
//   }) {
//     final distanceModel = <ServiceProviderModel>[];
//     final teste = <int>[];
//     int? distance;
//     final serviceProviderData = result.data
//         ?.map(
//           (e) => ServiceProviderModel.fromDataSource(e),
//         )
//         .toList();
//     for (var element in serviceProviderData!) {
//       final latitude =
//           element.userData.map((e) => e.userLocationLatitude).first;
//       final longitude =
//           element.userData.map((e) => e.userLocationLongitude).first;
//       distance = _distanceHelperCalculate.caculateDistanceToInt(
//         currentUserLocation: Location(
//           latitude: params.currentUserLocationLatitude,
//           longitude: params.currentUserLocationLongitude,
//         ),
//         serviceProviderLocation: Location(
//           latitude: latitude!,
//           longitude: longitude!,
//         ),
//       );
//       teste.add(distance);
//       log(teste.toString());
//     }
//     // for (var element in serviceProviderData!) {
//     //   final latitude =
//     //       element.userData.map((e) => e.userLocationLatitude).first;
//     //   final longitude =
//     //       element.userData.map((e) => e.userLocationLongitude).first;
//     //   distance = _distanceHelperCalculate.caculateDistanceToInt(
//     //     currentUserLocation: Location(
//     //       latitude: params.currentUserLocationLatitude,
//     //       longitude: params.currentUserLocationLongitude,
//     //     ),
//     //     serviceProviderLocation: Location(
//     //       latitude: latitude!,
//     //       longitude: longitude!,
//     //     ),
//     //   );
//     //   distanceModel.addAll(
//     //     result.data!.map(
//     //       (e) => ServiceProviderModel.fromDataSource(
//     //         e,
//     //         distance: distance,
//     //       ),
//     //     ),
//     //   );
//     // }
//     // for (var serviceProviderModel in serviceProviderData!) {
//     //   for (var serviceProviderData in serviceProviderModel.userData) {
//     //     distance = _distanceHelperCalculate.caculateDistanceToInt(
//     //       currentUserLocation: Location(
//     //         latitude: params.currentUserLocationLatitude,
//     //         longitude: params.currentUserLocationLongitude,
//     //       ),
//     //       serviceProviderLocation: Location(
//     //         latitude: serviceProviderData.userLocationLatitude ?? 0.0,
//     //         longitude: serviceProviderData.userLocationLongitude ?? 0.0,
//     //       ),
//     //     );
//     //   }
//     //   distanceModel.addAll(
//     //     result.data?.map((e) =>
//     //             ServiceProviderModel.fromDataSource(e, distance: distance)) ??
//     //         [],
//     //   );
//     // }
//     return distanceModel;
//   }
