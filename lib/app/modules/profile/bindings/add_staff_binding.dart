import 'package:bizne_fonda_app/app/data/repository/profile/staff_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_staff_controller.dart';
import 'package:get/get.dart';

class AddStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddStaffController(repository: StaffRepositoryImpl()));
  }
}
