import 'package:bizne_fonda_app/app/models/home/notification.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class NotificationsRepository {
  Future<ResponseRepository<List<Notification>>> getNotifications();
}
