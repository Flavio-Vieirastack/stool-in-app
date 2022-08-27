import 'package:dio/dio.dart';

import '../../../../exports/app_exports.dart';



class AuthorizationRestClientInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await ReadLocalSecureStorageMethodImpl()
        .read(key: KeysConstants.userToken);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
