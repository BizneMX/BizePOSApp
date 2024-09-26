import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/profile/schedule_repository.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_schedule_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SchedulesController extends LayoutRouteController {
  final ScheduleRepository repository;

  SchedulesController({required this.repository});

  void load() async {
    EasyLoading.show();
    final response = await repository.getSchedule();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    Get.find<AddScheduleController>().setSchedules(response.data!);
  }

  void save() async {
    if (!Get.find<AddScheduleController>().validate()) return;

    EasyLoading.show();
    final response = await repository
        .setSchedule(Get.find<AddScheduleController>().schedules);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    popNavigate();
  }
}
