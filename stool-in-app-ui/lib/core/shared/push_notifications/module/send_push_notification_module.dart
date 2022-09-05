import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource_impl.dart';
import 'package:stool_in/core/shared/push_notifications/data/repository/send_push_notification_repository_impl.dart';
import 'package:stool_in/exports/app_exports.dart';

import '../domain/repository/send_push_notification_repository.dart';
import '../domain/usecase/send_push_notification_usecase.dart';
import '../domain/usecase/send_push_notification_usecase_impl.dart';

class SendPushNotificationModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<SendPushNotificationDatasource>(
        create: (context) => SendPushNotificationDatasourceImpl(
          restClientPost: Inject<RestClientPost>(context).get(),
        ),
      ),
      Provider<SendPushNotificationRepository>(
        create: (context) => SendPushNotificationRepositoryImpl(
          sendPushNotificationDatasource:
              Inject<SendPushNotificationDatasource>(context).get(),
        ),
      ),
      Provider<SendPushNotificationUsecase>(
        create: (context) => SendPushNotificationUsecaseImpl(
          sendPushNotificationRepository:
              Inject<SendPushNotificationRepository>(context).get(),
        ),
      ),
    ];
  }
}
