import 'package:bizne_fonda_app/app/data/repository/auth/login_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(repository: LoginRepositoryImpl()));
  }
}
