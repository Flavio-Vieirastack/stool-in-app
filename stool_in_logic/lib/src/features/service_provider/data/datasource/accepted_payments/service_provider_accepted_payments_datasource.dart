
import '../../../../home/data/model/service_provider/accepted_payments_model.dart';
import '../../../../home/domain/entity/service_provider/accepted_payments_entity.dart';
abstract class ServiceProviderAcceptedPaymentsDatasource {
  Future<void> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsModel acceptedPaymentsModel,
  });
  Future<void> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsModel acceptedPaymentsModel,
  });
  Future<void> deleteAcceptedPayment({
    required int paymentId,
  });
  Future<AcceptedPaymentsEntity> getAcceptedPaymentUnique({
    required int paymentId,
  });
}
