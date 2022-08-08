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

    result.addAll({'ida': id});
    result.addAll({'serviceProviderDescriptiona': serviceProviderDescription});
    result.addAll({'statusa': status});
    result.addAll({'initialDisponibleTimea': initialDisponibleTime});
    result.addAll({'endDisponibleTimea': endDisponibleTime});
    result.addAll({'disponibleDaysa': disponibleDays});
    result.addAll({'createdAta': createdAt.millisecondsSinceEpoch});
    result.addAll({'userDataIda': userDataId});
    result.addAll({
      'executionServicesa':
          executionServicesModel.map((x) => x.toMap()).toList()
    });
    result.addAll({
      'servicesToExecutea':
          servicesToExecuteModel.map((x) => x.toMap()).toList()
    });
    result.addAll({'comentsa': comentsModel.map((x) => x.toMap()).toList()});
    result.addAll({'userDataa': userDataModel.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ServiceProviderModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
      id: map['ida']?.toInt() ?? 0,
      serviceProviderDescription: map['serviceProviderDescriptiona'] ?? '',
      status: map['statusa'] ?? '',
      initialDisponibleTime: map['initialDisponibleTimea'] ?? '',
      endDisponibleTime: map['endDisponibleTimea'] ?? '',
      disponibleDays: map['disponibleDaysa'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAta']),
      userDataId: map['userDataIda'] ?? '',
      executionServicesModel: List<ExecutionServicesModel>.from(
          map['executionServicesa']
              ?.map((x) => ExecutionServicesModel.fromMap(x))),
      servicesToExecuteModel: List<ServicesToExecuteModel>.from(
          map['servicesToExecutea']
              ?.map((x) => ServicesToExecuteModel.fromMap(x))),
      comentsModel: List<ComentsModel>.from(
          map['comentsa']?.map((x) => ComentsModel.fromMap(x))),
      userDataModel: List<UserDataModel>.from(
          map['userDataa']?.map((x) => UserDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProviderModel.fromJson(String source) =>
      ServiceProviderModel.fromMap(json.decode(source));
}
