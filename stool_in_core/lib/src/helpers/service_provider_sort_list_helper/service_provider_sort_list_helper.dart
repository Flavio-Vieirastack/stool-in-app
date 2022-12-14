
import 'package:stool_in_logic/stool_in_logic.dart';

class ServiceProviderSortListHelper {
  List<ServiceProviderEntity> sortList({
    required List<ServiceProviderEntity> providers,
  }) {
    providers.sort((a, b) => a.distance.compareTo(b.distance));
    return providers;
  }
  List<ServiceProviderEntity> sortByVotes({
    required List<ServiceProviderEntity> providers,
  }) {
    providers.sort((a, b) => a.votes!.compareTo(b.votes ?? 0));
    return providers.reversed.toList().where((e) => e.distance < 1400000000000).toList();
    // TODO mudar esse numero depois
  }
}