import 'package:bizne_fonda_app/app/data/repository/auth/splash_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(repository: SplashRepositoryImpl()));
  }
}
