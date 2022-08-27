


import '../../../exports/app_exports.dart';

class ServiceProviderSortListHelper {
  List<ServiceProviderEntity> sortList({
    required List<ServiceProviderEntity> providers,
  }) {
    providers.sort((a, b) => a.distance.compareTo(b.distance));
    return providers;
  }
}
