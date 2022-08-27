

import '../../../features/home/export/home_export.dart';

class ServiceProviderSortListHelper {
  List<ServiceProviderEntity> sortList({
    required List<ServiceProviderEntity> providers,
  }) {
    providers.sort((a, b) => a.distance.compareTo(b.distance));
    return providers;
  }
}
