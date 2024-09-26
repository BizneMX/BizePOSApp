import 'package:bizne_fonda_app/app/data/repository/home/notifications_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        NotificationsController(repository: NotificationsRepositoryImpl()));
  }
}
