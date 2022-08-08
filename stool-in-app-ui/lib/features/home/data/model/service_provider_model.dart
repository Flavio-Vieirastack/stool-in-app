import 'dart:convert';

import 'package:stool_in_app_ui/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_ui/features/home/data/model/coments_model.dart';
import 'package:stool_in_app_ui/features/home/data/model/execution_services_model.dart';
import 'package:stool_in_app_ui/features/home/data/model/services_to_execute_model.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';

class ServiceProviderModel extends ServiceProviderEntity {
  final List<ExecutionServicesModel> executionServicesModel;
  final List<ServicesToExecuteModel> servicesToExecuteModel;
  final List<ComentsModel> comentsModel;
  final List<UserDataModel> userDataModel;
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
    required this.userDataModel,
  }) : super(
          coments: comentsModel,
          executionServices: executionServicesModel,
          servicesToExecute: servicesToExecuteModel,
          userData: userDataModel,
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
      'executionServices':
          executionServicesModel.map((x) => x.toMap()).toList()
    });
    result.addAll({
      'servicesToExecute':
          servicesToExecuteModel.map((x) => x.toMap()).toList()
    });
    result.addAll({'coments': comentsModel.map((x) => x.toMap()).toList()});
    result.addAll({'UserData': userDataModel.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ServiceProviderModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
      id: map['id']?.toInt() ?? 0,
      serviceProviderDescription: map['userDescription'] ?? '',
      status: map['status'] ?? '',
      initialDisponibleTime: map['initialDisponibleTime'] ?? '',
      endDisponibleTime: map['endDisponibleTime'] ?? '',
      disponibleDays: map['disponibleDays'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      userDataId: map['userDataId'] ?? '',
      executionServicesModel: List<ExecutionServicesModel>.from(
          map['executionServices']
              ?.map((x) => ExecutionServicesModel.fromMap(x))),
      servicesToExecuteModel: List<ServicesToExecuteModel>.from(
          map['servicesToExecute']
              ?.map((x) => ServicesToExecuteModel.fromMap(x))),
      comentsModel: List<ComentsModel>.from(
          map['coments']?.map((x) => ComentsModel.fromMap(x))),
      userDataModel: List<UserDataModel>.from(
          map['UserData']?.map((x) => UserDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProviderModel.fromJson(String source) =>
      ServiceProviderModel.fromMap(json.decode(source));
}
