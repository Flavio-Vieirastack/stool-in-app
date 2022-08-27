import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../helpers/export/helpers_export.dart';
import '../../../shared/export/shared_export.dart';


class InternetCheckInterceptor
    with SharedPreferencesHelper
    implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      InternetConnectionCubit().emitNotConnectionState();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
