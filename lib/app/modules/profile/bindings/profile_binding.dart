import 'package:bizne_fonda_app/app/data/repository/profile/profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(repository: ProfileRepositoryImpl()));
  }
}
