// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in_logic/src/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/accepted_payments_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/execution_services_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/services_to_execute_entity.dart';

class ServiceProviderEntity {
  final int id;
  final String? serviceProviderDescription;
  final int? votes;
  final String? status;
  final String? initialDisponibleTime;
  final String? endDisponibleTime;
  final String? disponibleDays;
  final DateTime createdAt;
  final int userLoginId;
  int distance;
  final List<ExecutionServicesEntity> executionServices;
  final List<ServicesToExecuteEntity> servicesToExecute;
  final List<ComentsEntity> coments;
  final List<UserDataEntity> userData;
  final List<AcceptedPaymentsEntity> acceptedPayments;
  ServiceProviderEntity({
    required this.id,
    required this.distance,
    required this.serviceProviderDescription,
    required this.status,
    required this.votes,
    required this.initialDisponibleTime,
    required this.endDisponibleTime,
    required this.disponibleDays,
    required this.createdAt,
    required this.userLoginId,
    required this.executionServices,
    required this.servicesToExecute,
    required this.coments,
    required this.userData,
    required this.acceptedPayments,
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
        other.votes == votes &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays &&
        other.createdAt == createdAt &&
        other.userLoginId == userLoginId &&
        other.distance == distance &&
        listEquals(other.executionServices, executionServices) &&
        listEquals(other.servicesToExecute, servicesToExecute) &&
        listEquals(other.coments, coments) &&
        listEquals(other.userData, userData) &&
        listEquals(other.acceptedPayments, acceptedPayments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serviceProviderDescription.hashCode ^
        votes.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode ^
        createdAt.hashCode ^
        userLoginId.hashCode ^
        distance.hashCode ^
        executionServices.hashCode ^
        servicesToExecute.hashCode ^
        coments.hashCode ^
        userData.hashCode ^
        acceptedPayments.hashCode;
  }
}
