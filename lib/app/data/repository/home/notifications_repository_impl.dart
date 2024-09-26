import 'package:bizne_fonda_app/app/data/core/home/notifications_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/notification.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class NotificationsRepositoryImpl extends NotificationsRepository {
  @override
  Future<ResponseRepository<List<Notification>>> getNotifications() async {
    final response = await Api().get(Endpoints.notifications, {});

    return response.toResponseRepository(
        fromJson: (data) =>
            data.map<Notification>((e) => Notification.fromJson(e)).toList());
  }
}
