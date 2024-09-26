import 'package:bizne_fonda_app/app/data/repository/auth/login_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/recover_password_controller.dart';
import 'package:get/get.dart';

class RecoverPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => RecoverPasswordController(repository: LoginRepositoryImpl()));
  }
}
