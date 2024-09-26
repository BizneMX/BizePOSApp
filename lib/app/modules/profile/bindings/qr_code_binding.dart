import 'package:bizne_fonda_app/app/data/repository/profile/profile_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/qr_code_controller.dart';
import 'package:get/get.dart';

class QrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrCodeController(repository: ProfileRepositoryImpl()));
  }
}
