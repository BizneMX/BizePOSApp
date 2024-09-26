import 'package:bizne_fonda_app/app/data/repository/auth/complete_profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/complete_profile_controller.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_schedule_controller.dart';
import 'package:get/get.dart';

class CompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileController(
        phone: Get.arguments, repository: CompleteProfileRepositoryImpl()));
    Get.lazyPut(() => AddScheduleController());
  }
}
