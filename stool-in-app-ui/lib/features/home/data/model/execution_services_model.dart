import 'dart:convert';

import 'package:stool_in_app_ui/features/home/domain/entity/execution_services_entity.dart';


class ExecutionServicesModel extends ExecutionServicesEntity {
  
  ExecutionServicesModel({
    required super.id,
    required super.serviceName,
    required super.price,
    required super.estimatedHours,
    required super.serviceProviderId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'ida': id});
    result.addAll({'serviceNamea': serviceName});
    result.addAll({'pricea': price});
    result.addAll({'estimatedHoursa': estimatedHours});
    result.addAll({'serviceProviderIda': serviceProviderId});
  
    return result;
  }

  factory ExecutionServicesModel.fromMap(Map<String, dynamic> map) {
    return ExecutionServicesModel(
      id: map['ida']?.toInt() ?? 0,
      serviceName: map['serviceNamea'] ?? '',
      price: map['pricea']?.toDouble() ?? 0.0,
      estimatedHours: map['estimatedHoursa']?.toInt() ?? 0,
      serviceProviderId: map['serviceProviderIda']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExecutionServicesModel.fromJson(String source) => ExecutionServicesModel.fromMap(json.decode(source));
}
