import 'package:bizne_fonda_app/app/data/repository/profile/schedule_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_schedule_controller.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/schedules_controller.dart';
import 'package:get/get.dart';

class SchedulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => SchedulesController(repository: ScheduleRepositoryImpl()));
    Get.lazyPut(() => AddScheduleController());
  }
}
