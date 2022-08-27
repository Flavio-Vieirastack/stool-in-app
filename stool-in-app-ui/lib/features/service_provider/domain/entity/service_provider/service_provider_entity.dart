// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in/features/auth/export/auth_exports.dart';
import 'package:stool_in/features/home/export/home_export.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/acepted_payments_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/user_login_entity.dart';

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
