import 'package:bizne_fonda_app/app/data/repository/profile/profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController(repository:  ProfileRepositoryImpl()));
  }
}
