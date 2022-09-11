// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import 'package:stool_in_logic/src/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_logic/src/features/home/data/model/service_provider/accepted_payments_model.dart';
import 'package:stool_in_logic/src/features/home/data/model/service_provider/coments_model.dart';
import 'package:stool_in_logic/src/features/home/data/model/service_provider/services_to_execute_model.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';

import 'execution_services_model.dart';

class ServiceProviderModel extends ServiceProviderEntity {
  final List<ExecutionServicesModel> executionServicesModel;
  final List<ServicesToExecuteModel> servicesToExecuteModel;
  final List<ComentsModel> comentsModel;
  ServiceProviderModel({
    required super.id,
    required super.serviceProviderDescription,
    required super.status,
    required super.initialDisponibleTime,
    required super.endDisponibleTime,
    required super.disponibleDays,
    required super.createdAt,
    required super.userLoginId,
    required super.votes,
    required this.executionServicesModel,
    required this.servicesToExecuteModel,
    required super.acceptedPayments,
    required this.comentsModel,
    required super.userData,
    required super.distance,
  }) : super(
          coments: comentsModel,
          executionServices: executionServicesModel,
          servicesToExecute: servicesToExecuteModel,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (serviceProviderDescription != null) {
      result.addAll({'userDescription': serviceProviderDescription});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (votes != null) {
      result.addAll({'votes': votes});
    }
    if (initialDisponibleTime != null) {
      result.addAll({'initialDisponibleTime': initialDisponibleTime});
    }
    if (endDisponibleTime != null) {
      result.addAll({'endDisponibleTime': endDisponibleTime});
    }
    if (disponibleDays != null) {
      result.addAll({'disponibleDays': disponibleDays});
    }

    return result;
  }

  factory ServiceProviderModel.fromDataSource(
    Map<String, dynamic> map, {
    int? distance,
  }) {
    final createdAt = DateTime.parse(map['createdAt']);
    return ServiceProviderModel(
      id: map['id']?.toInt() ?? 0,
      serviceProviderDescription: map['userDescription'] ?? '',
      status: map['status'] ?? '',
      initialDisponibleTime: map['initialDisponibleTime'] ?? '',
      endDisponibleTime: map['endDisponibleTime'] ?? '',
      disponibleDays: map['disponibleDays'] ?? '',
      createdAt: createdAt,
      userLoginId: map['userLoginId'] ?? '',
      votes: map['votes']?.toInt() ?? 0,
      acceptedPayments: List<AcceptedPaymentsModel>.from(map['acceptedPaymnets']
          ?.map((x) => AcceptedPaymentsModel.fromMap(x))),
      executionServicesModel: List<ExecutionServicesModel>.from(
          map['executionServices']
              ?.map((x) => ExecutionServicesModel.fromMap(x))),
      servicesToExecuteModel: List<ServicesToExecuteModel>.from(
          map['servicesToExecute']
              ?.map((x) => ServicesToExecuteModel.fromMap(x))),
      comentsModel: List<ComentsModel>.from(
          map['coments']?.map((x) => ComentsModel.fromMap(x))),
      userData: List<UserDataModel>.from(
          map['userData']?.map((x) => UserDataModel.fromMap(x))),
      distance: distance ?? 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ServiceProviderModel &&
        listEquals(other.executionServicesModel, executionServicesModel) &&
        listEquals(other.servicesToExecuteModel, servicesToExecuteModel) &&
        listEquals(other.comentsModel, comentsModel) &&
        listEquals(other.userData, userData);
  }

  @override
  int get hashCode {
    return executionServicesModel.hashCode ^
        servicesToExecuteModel.hashCode ^
        comentsModel.hashCode ^
        userData.hashCode;
  }

  @override
  String toString() =>
      'ServiceProviderModel(executionServicesModel: $executionServicesModel, servicesToExecuteModel: $servicesToExecuteModel, comentsModel: $comentsModel), Distance: $distance';

  ServiceProviderModel copyWith() {
    return ServiceProviderModel(
      id: id,
      acceptedPayments: acceptedPayments,
      createdAt: createdAt,
      disponibleDays: disponibleDays,
      distance: distance,
      endDisponibleTime: endDisponibleTime,
      initialDisponibleTime: initialDisponibleTime,
      serviceProviderDescription: serviceProviderDescription,
      status: status,
      userData: userData,
      userLoginId: userLoginId,
      votes: votes,
      executionServicesModel:
          executionServicesModel,
      servicesToExecuteModel:
          servicesToExecuteModel ,
      comentsModel: comentsModel ,
    );
  }
}
