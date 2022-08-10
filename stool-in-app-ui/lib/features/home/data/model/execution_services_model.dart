import 'dart:convert';

import 'package:stool_in/features/home/domain/entity/execution_services_entity.dart';

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

    result.addAll({'id': id});
    result.addAll({'serviceName': serviceName});
    result.addAll({'price': price});
    result.addAll({'estimatedHours': estimatedHours});
    result.addAll({'serviceProviderId': serviceProviderId});

    return result;
  }

  factory ExecutionServicesModel.fromMap(Map<String, dynamic> map) {
    final price = double.tryParse(map['price']);
    return ExecutionServicesModel(
      id: map['id']?.toInt() ?? 0,
      serviceName: map['serviceName'] ?? '',
      price: price ?? 0.0,
      estimatedHours: map['estimatedHours']?.toInt() ?? 0,
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExecutionServicesModel.fromJson(String source) =>
      ExecutionServicesModel.fromMap(json.decode(source));
}
