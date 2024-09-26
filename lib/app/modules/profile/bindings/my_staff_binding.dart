import 'package:bizne_fonda_app/app/data/repository/profile/staff_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/my_staff_controller.dart';
import 'package:get/get.dart';

class MyStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyStaffController(repository: StaffRepositoryImpl()));
  }
}
