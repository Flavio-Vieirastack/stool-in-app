// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in_logic/src/features/service_provider/domain/entity/service_provider/user_login_entity.dart';

import '../../../../auth/domain/entity/user_data_entity.dart';
import '../../../../home/domain/entity/service_provider/coments_entity.dart';
import '../../../../home/domain/entity/service_provider/execution_services_entity.dart';
import '../../../../home/domain/entity/service_provider/services_to_execute_entity.dart';
import 'acepted_payments_entity.dart';
import 'create_and_update_service_provider_entity.dart';

class ServiceProviderEntity extends CreateAndUpdateServiceProviderEntity {
  final int id;
  final DateTime createdAt;
  final int userLoginId;
  final List<ExecutionServicesEntity> executionServices;
  final List<ServicesToExecuteEntity> servicesToExecute;
  final List<ComentsEntity> coments;
  final List<AceptedPaymentsEntity> acceptedPayments;
  final List<UserLoginEntity> userLogin;
  final List<UserDataEntity> userData;
  ServiceProviderEntity({
    required this.id,
    required this.createdAt,
    required this.userLoginId,
    required this.executionServices,
    required this.servicesToExecute,
    required this.coments,
    required this.acceptedPayments,
    required this.userLogin,
    required this.userData,
    required super.disponibleDays,
    required super.endDisponibleTime,
    required super.initialDisponibleTime,
    required super.status,
    required super.userDescription,
    required super.votes,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is ServiceProviderEntity &&
      other.id == id &&
      other.createdAt == createdAt &&
      other.userLoginId == userLoginId &&
      listEquals(other.executionServices, executionServices) &&
      listEquals(other.servicesToExecute, servicesToExecute) &&
      listEquals(other.coments, coments) &&
      listEquals(other.acceptedPayments, acceptedPayments) &&
      listEquals(other.userLogin, userLogin) &&
      listEquals(other.userData, userData);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createdAt.hashCode ^
      userLoginId.hashCode ^
      executionServices.hashCode ^
      servicesToExecute.hashCode ^
      coments.hashCode ^
      acceptedPayments.hashCode ^
      userLogin.hashCode ^
      userData.hashCode;
  }
}
