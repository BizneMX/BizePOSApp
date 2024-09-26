import 'package:bizne_fonda_app/app/data/repository/auth/banner_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/banner_controller.dart';
import 'package:get/get.dart';

class BannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BannerController(
        repository: BannerRepositoryImpl(), fistLogin: Get.arguments));
  }
}
