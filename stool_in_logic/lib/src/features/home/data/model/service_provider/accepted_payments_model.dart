import 'dart:convert';

import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';

class AcceptedPaymentsModel extends AcceptedPaymentsEntity {
  AcceptedPaymentsModel({
    super.id,
    super.payment,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcceptedPaymentsModel &&
        other.id == id &&
        other.payment == payment;
  }

  @override
  int get hashCode => id.hashCode ^ payment.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (payment != null) {
      result.addAll({'paymenct': payment});
    }

    return result;
  }

  factory AcceptedPaymentsModel.fromMap(Map<String, dynamic> map) {
    return AcceptedPaymentsModel(
      id: map['id']?.toInt() ?? 0,
      payment: map['paymenct'] ?? '',
    );
  }

  factory AcceptedPaymentsModel.fromEntity(
      {required AcceptedPaymentsEntity acceptedPaymentsEntity}) {
    return AcceptedPaymentsModel(
      id: acceptedPaymentsEntity.id,
      payment: acceptedPaymentsEntity.payment,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcceptedPaymentsModel.fromJson(String source) =>
      AcceptedPaymentsModel.fromMap(json.decode(source));
}
