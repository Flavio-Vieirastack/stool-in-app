// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/home/data/model/coments_model.dart';
import 'package:stool_in/features/home/data/model/execution_services_model.dart';
import 'package:stool_in/features/home/data/model/services_to_execute_model.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';

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
    required super.userDataId,
    required this.executionServicesModel,
    required this.servicesToExecuteModel,
    required this.comentsModel,
    required super.authEntity,
    required super.distance,
  }) : super(
          coments: comentsModel,
          executionServices: executionServicesModel,
          servicesToExecute: servicesToExecuteModel,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userDescription': serviceProviderDescription});
    result.addAll({'status': status});
    result.addAll({'initialDisponibleTime': initialDisponibleTime});
    result.addAll({'endDisponibleTime': endDisponibleTime});
    result.addAll({'disponibleDays': disponibleDays});
    result.addAll({
      'executionServices': executionServicesModel.map((x) => x.toMap()).toList()
    });
    result.addAll({
      'servicesToExecute': servicesToExecuteModel.map((x) => x.toMap()).toList()
    });
    result.addAll({'coments': comentsModel.map((x) => x.toMap()).toList()});
    result.addAll({'UserData': authEntity});

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
      userDataId: map['userDataId'] ?? '',
      executionServicesModel: List<ExecutionServicesModel>.from(
          map['executionServices']
              ?.map((x) => ExecutionServicesModel.fromMap(x))),
      servicesToExecuteModel: List<ServicesToExecuteModel>.from(
          map['servicesToExecute']
              ?.map((x) => ServicesToExecuteModel.fromMap(x))),
      comentsModel: List<ComentsModel>.from(
          map['coments']?.map((x) => ComentsModel.fromMap(x))),
      authEntity: AuthModel.fromMap(map['UserData']),
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
        listEquals(other.authEntity, authEntity);
  }

  @override
  int get hashCode {
    return executionServicesModel.hashCode ^
        servicesToExecuteModel.hashCode ^
        comentsModel.hashCode ^
        authEntity.hashCode;
  }
}
