import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/notifications_repository.dart';
import 'package:bizne_fonda_app/app/models/home/notification.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NotificationsController extends LayoutRouteController {
  final NotificationsRepository repository;

  NotificationsController({required this.repository});

  var data = <Notification>[].obs;
  var noData = false.obs;

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getNotifications();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    noData.value = response.data!.isEmpty;
    data.value = response.data!;
  }
}
