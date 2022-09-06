import 'dart:developer';
import 'package:dartz/dartz.dart';

import '../../../../../exports/app_exports.dart';
import '../../../../home/data/model/service_provider/accepted_payments_model.dart';
import '../../../../home/domain/entity/service_provider/accepted_payments_entity.dart';
import '../../../domain/repository/accepted_payments/service_provider_accepted_payments_repository.dart';

class ServiceProviderAcceptedPaymentsRepositoryImpl
    implements ServiceProviderAcceptedPaymentsRepository {
  final ServiceProviderAcceptedPaymentsDatasource
      _serviceProviderAcceptedPaymentsDatasource;
  ServiceProviderAcceptedPaymentsRepositoryImpl({
    required ServiceProviderAcceptedPaymentsDatasource
        serviceProviderAcceptedPaymentsDatasource,
  }) : _serviceProviderAcceptedPaymentsDatasource =
            serviceProviderAcceptedPaymentsDatasource;
  @override
  Future<Either<AcceptedPaymentsError, void>> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  }) async {
    try {
      final result = await _serviceProviderAcceptedPaymentsDatasource
          .createAcceptedPayment(
        serviceProviderid: serviceProviderid,
        acceptedPaymentsModel: AcceptedPaymentsModel.fromEntity(
            acceptedPaymentsEntity: acceptedPaymentsEntity),
      );
      return Right(result);
    } on AcceptedPaymentsError catch (e, s) {
      log('Erro ao criar pagamento aceito no repository impl',
          error: e, stackTrace: s);
      return Left(
        AcceptedPaymentsError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao criar pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message: 'Erro interno ao criar campo, tente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<AcceptedPaymentsError, AcceptedPaymentsEntity>>
      getAcceptedPaymentUnique({
    required int paymentId,
  }) async {
    try {
      final result = await _serviceProviderAcceptedPaymentsDatasource
          .getAcceptedPaymentUnique(
        paymentId: paymentId,
      );
      return Right(result);
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro pegar dados de pagamentos aceitos no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message:
              'Erro interno ao buscar seus pagamentos aceitos, tente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<AcceptedPaymentsError, void>> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  }) async {
    try {
      final result = await _serviceProviderAcceptedPaymentsDatasource
          .updateAcceptedPayment(
        paymentId: paymentId,
        acceptedPaymentsModel: AcceptedPaymentsModel.fromEntity(
            acceptedPaymentsEntity: acceptedPaymentsEntity),
      );
      return Right(result);
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro ao fazer update do pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer update do pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message:
              'Erro interno ao atualizar seu pagamento aceito, tente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<AcceptedPaymentsError, void>> deleteAcceptedPayment({
    required int paymentId,
  }) async {
    try {
      final result = await _serviceProviderAcceptedPaymentsDatasource
          .deleteAcceptedPayment(paymentId: paymentId);
      return Right(result);
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro ao deletar pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado deletar pagamento aceito no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        AcceptedPaymentsError(
          message:
              'Erro interno ao deletar seu pagamento aceito, tente mais tarde',
        ),
      );
    }
  }
}
