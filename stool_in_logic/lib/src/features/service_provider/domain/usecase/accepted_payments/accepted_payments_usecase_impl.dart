import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/accepted_payments_entity.dart';
import '../../error/accepted_payments_error.dart';
import '../../repository/accepted_payments/service_provider_accepted_payments_repository.dart';
import 'accepted_payments_usecase.dart';

class AcceptedPaymentsUsecaseImpl implements AcceptedPaymentsUsecase {
  final ServiceProviderAcceptedPaymentsRepository
      _serviceProviderAcceptedPaymentsRepository;
  AcceptedPaymentsUsecaseImpl({
    required ServiceProviderAcceptedPaymentsRepository
        serviceProviderAcceptedPaymentsRepository,
  }) : _serviceProviderAcceptedPaymentsRepository =
            serviceProviderAcceptedPaymentsRepository;
  @override
  Future<Either<AcceptedPaymentsError, void>> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  }) async {
    return await _serviceProviderAcceptedPaymentsRepository
        .createAcceptedPayment(
      serviceProviderid: serviceProviderid,
      acceptedPaymentsEntity: acceptedPaymentsEntity,
    );
  }

  @override
  Future<Either<AcceptedPaymentsError, AcceptedPaymentsEntity>>
      getAcceptedPaymentUnique({
    required int paymentId,
  }) async {
    return await _serviceProviderAcceptedPaymentsRepository
        .getAcceptedPaymentUnique(
      paymentId: paymentId,
    );
  }

  @override
  Future<Either<AcceptedPaymentsError, void>> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  }) async {
    return await _serviceProviderAcceptedPaymentsRepository
        .updateAcceptedPayment(
      paymentId: paymentId,
      acceptedPaymentsEntity: acceptedPaymentsEntity,
    );
  }

  @override
  Future<Either<AcceptedPaymentsError, void>> deleteAcceptedPayment({
    required int paymentId,
  }) async {
    return await _serviceProviderAcceptedPaymentsRepository
        .deleteAcceptedPayment(paymentId: paymentId);
  }
}
