import 'package:stool_in/features/service_provider/domain/error/accepted_payments_error.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/usecase/accepted_payments/accepted_payments_usecase.dart';

import '../../repository/accepted_payments/service_provider_accepted_payments_repository.dart';

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
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  }) async {
    return await _serviceProviderAcceptedPaymentsRepository
        .getAcceptedPaymentUnique(
      paymentId: paymentId,
      acceptedPaymentsEntity: acceptedPaymentsEntity,
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
