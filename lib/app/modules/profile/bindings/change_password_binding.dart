import 'package:bizne_fonda_app/app/data/repository/profile/profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ChangePasswordController(repository: ProfileRepositoryImpl()));
  }
}
