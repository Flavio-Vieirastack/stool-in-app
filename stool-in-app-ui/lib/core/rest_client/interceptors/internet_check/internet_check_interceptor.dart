import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/core/shared/presenter/cubit/internet_connection_cubit/internet_connection_cubit.dart';

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
