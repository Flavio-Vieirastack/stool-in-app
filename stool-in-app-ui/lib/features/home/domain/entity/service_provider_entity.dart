// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/services_to_execute_entity.dart';

class ServiceProviderEntity {
  final int id;
  final String serviceProviderDescription;
  final String status;
  final String initialDisponibleTime;
  final String endDisponibleTime;
  final String disponibleDays;
  final DateTime createdAt;
  final int userDataId;
  final int distance;
  final List<ExecutionServicesEntity> executionServices;
  final List<ServicesToExecuteEntity> servicesToExecute;
  final List<ComentsEntity> coments;
  final UserDataEntity userData;
  ServiceProviderEntity({
    required this.id,
    required this.distance,
    required this.serviceProviderDescription,
    required this.status,
    required this.initialDisponibleTime,
    required this.endDisponibleTime,
    required this.disponibleDays,
    required this.createdAt,
    required this.userDataId,
    required this.executionServices,
    required this.servicesToExecute,
    required this.coments,
    required this.userData,
  });

  String distanceFormat() {
    if (distance >= 1000) {
      final convert = distance.toString();
      final lastCharactersRemoved = convert.substring(0, convert.length - 3);
      final format = '$lastCharactersRemoved KM';
      return format;
    } else {
      final convert = distance.toString();
      final format = '$convert M';
      return format;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ServiceProviderEntity &&
        other.id == id &&
        other.serviceProviderDescription == serviceProviderDescription &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays &&
        other.createdAt == createdAt &&
        other.userDataId == userDataId &&
        other.distance == distance &&
        listEquals(other.executionServices, executionServices) &&
        listEquals(other.servicesToExecute, servicesToExecute) &&
        listEquals(other.coments, coments) &&
        other.userData == userData;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serviceProviderDescription.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode ^
        createdAt.hashCode ^
        userDataId.hashCode ^
        distance.hashCode ^
        executionServices.hashCode ^
        servicesToExecute.hashCode ^
        coments.hashCode ^
        userData.hashCode;
  }
}
