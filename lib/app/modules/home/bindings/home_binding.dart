import 'package:bizne_fonda_app/app/data/repository/home/home_repository_impl.dart';
import 'package:bizne_fonda_app/app/data/repository/profile/profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        repository: HomeRepositoryImpl(),
        profileRepository: ProfileRepositoryImpl()));
  }
}
